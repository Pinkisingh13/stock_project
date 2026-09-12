import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/core/errors/upstox_exception.dart';
import 'package:frontend/features/home/model/search_option_model.dart';
import 'package:frontend/features/option_details/model/option_market_data.dart';
import 'package:frontend/generated/MarketDataFeed.pb.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

class UpstoxWebSocketService {
  final String upstoxAccessToken =
      dotenv.env['UPSTOX_ANALYTICS_ACCESS_TOKEN'] ?? '';

  final String upstoxBaseUrl = dotenv.env['UPSTOX_BASE_URL'] ?? '';

  WebSocketChannel? activeWebSocketChannel;
  StreamSubscription<dynamic>? webSocketListener;

  Future<void> openOptionWebSocket(
    SearchOptionModel selectedOption, {
    required void Function(OptionDetailsMarketData optionData) onOptionData,
    required void Function(UpstoxApiException error) onConnectionError,
  }) async {
    if (upstoxAccessToken.isEmpty || upstoxBaseUrl.isEmpty) {
      throw const UpstoxApiException(
        message:
            'Missing Upstox token or base URL. Add UPSTOX_ANALYTICS_ACCESS_TOKEN and UPSTOX_BASE_URL to .env.',
        debugDetails:
            'UPSTOX_ANALYTICS_ACCESS_TOKEN or UPSTOX_BASE_URL is empty or missing.',
      );
    }

    await closeOptionWebSocket();

    try {
      final authorizeResponse = await http.get(
        Uri.parse('$upstoxBaseUrl/v3/feed/market-data-feed/authorize'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $upstoxAccessToken',
        },
      );

      if (authorizeResponse.statusCode != 200) {
        throw UpstoxApiException(
          statusCode: authorizeResponse.statusCode,
          message: 'Unable to authorize the live market-data feed.',
          debugDetails:
              'Authorize request failed with ${authorizeResponse.statusCode}: '
              '${authorizeResponse.body.length <= 500 ? authorizeResponse.body : '${authorizeResponse.body.substring(0, 500)}…'}',
        );
      }

      final authorizationResponseData = jsonDecode(authorizeResponse.body);
      final authorizedRedirectUri =
          authorizationResponseData['data']['authorized_redirect_uri']
              .toString();

      if (authorizedRedirectUri.isEmpty) {
        throw const UpstoxApiException(
          message: 'Upstox did not return a WebSocket URL.',
          debugDetails: 'authorized_redirect_uri was missing.',
        );
      }

      final connectedWebSocketChannel = WebSocketChannel.connect(
        Uri.parse(authorizedRedirectUri),
      );
      activeWebSocketChannel = connectedWebSocketChannel;
      await connectedWebSocketChannel.ready;

      webSocketListener = connectedWebSocketChannel.stream.listen(
        (webSocketMessage) => handleOptionDataMessage(
          webSocketMessage,
          selectedOption.instrumentKey,
          onOptionData,
          onConnectionError,
        ),
        onError: (Object error, StackTrace stackTrace) {
          log(
            'Upstox WebSocket error.',
            name: 'UpstoxWebSocket',
            error: error,
            stackTrace: stackTrace,
            level: 1000,
          );
          onConnectionError(
            UpstoxWebSocketException(
              message: 'The live market-data connection encountered an error.',
              debugDetails: error.toString(),
            ),
          );
        },
        onDone: () {
          log(
            'Upstox WebSocket closed by the server.',
            name: 'UpstoxWebSocket',
            level: 900,
          );
          onConnectionError(const UpstoxWebSocketException.connectionClosed());
        },
      );

      final webSocketRequest = {
        'guid': DateTime.now().microsecondsSinceEpoch.toString(),
        'method': 'sub',
        'data': {
          'mode': 'full',
          'instrumentKeys': [selectedOption.instrumentKey],
        },
      };

      connectedWebSocketChannel.sink.add(
        Uint8List.fromList(utf8.encode(jsonEncode(webSocketRequest))),
      );

      log(
        'Option WebSocket opened for ${selectedOption.instrumentKey}.',
        name: 'UpstoxWebSocket',
      );
    } catch (error, stackTrace) {
      log(
        'Could not open the option WebSocket.',
        name: 'UpstoxWebSocket',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      rethrow;
    }
  }

  Future<void> closeOptionWebSocket() async {
    final currentWebSocketListener = webSocketListener;
    final currentWebSocketChannel = activeWebSocketChannel;

    webSocketListener = null;
    activeWebSocketChannel = null;

    await currentWebSocketListener?.cancel();
    await currentWebSocketChannel?.sink.close();

    if (currentWebSocketChannel != null) {
      log('Option WebSocket closed.', name: 'UpstoxWebSocket');
    }
  }

  Future<void> dispose() async {
    await closeOptionWebSocket();
  }

  void handleOptionDataMessage(
    dynamic webSocketMessage,
    String selectedOptionKey,
    void Function(OptionDetailsMarketData optionData) onOptionData,
    void Function(UpstoxApiException error) onConnectionError,
  ) {
    try {
      final feedResponse = FeedResponse.fromBuffer(webSocketMessage);

      if (feedResponse.type == Type.market_info) {
        return;
      }

      final selectedOptionFeed = feedResponse.feeds[selectedOptionKey];

      if (selectedOptionFeed == null ||
          !selectedOptionFeed.hasFullFeed() ||
          !selectedOptionFeed.fullFeed.hasMarketFF()) {
        return;
      }

      final optionFullFeed = selectedOptionFeed.fullFeed.marketFF;

      if (!optionFullFeed.hasLtpc() ||
          !optionFullFeed.hasMarketLevel() ||
          optionFullFeed.marketLevel.bidAskQuote.isEmpty) {
        return;
      }

      final bestQuote = optionFullFeed.marketLevel.bidAskQuote.first;
      double? openPrice;

      for (final candle in optionFullFeed.marketOHLC.ohlc) {
        if (candle.interval.toLowerCase() == '1d') {
          openPrice = candle.open;
          break;
        }
      }

      if (openPrice == null && optionFullFeed.marketOHLC.ohlc.isNotEmpty) {
        openPrice = optionFullFeed.marketOHLC.ohlc.first.open;
      }

      onOptionData(
        OptionDetailsMarketData(
          ltp: optionFullFeed.ltpc.ltp,
          previousClose: optionFullFeed.ltpc.cp,
          open: openPrice ?? 0,
          openInterest: optionFullFeed.oi,
          bidPrice: bestQuote.bidP,
          bidQuantity: bestQuote.bidQ.toInt(),
          askPrice: bestQuote.askP,
          askQuantity: bestQuote.askQ.toInt(),
          totalBidQuantity: optionFullFeed.tbq,
          totalAskQuantity: optionFullFeed.tsq,
          volume: optionFullFeed.vtt.toInt(),
        ),
      );
    } catch (error, stackTrace) {
      log(
        'Could not decode an Upstox option response.',
        name: 'UpstoxWebSocket',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      onConnectionError(const UpstoxWebSocketException.decodingFailed());
    }
  }
}
