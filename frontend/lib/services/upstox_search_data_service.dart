import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/core/errors/upstox_exception.dart';
import 'package:frontend/features/home/model/search_option_model.dart';
import 'package:http/http.dart' as http;

class UpstoxSearchDataService {
  final String accessToken =
      dotenv.env['UPSTOX_ANALYTICS_ACCESS_TOKEN']?.trim() ?? '';
  final String baseUrl =
      dotenv.env['UPSTOX_BASE_URL']?.trim() ?? 'https://api.upstox.com';

  // search for nifty options
  Future<List<SearchOptionModel>> searchNiftyOptions(String query) async {
    if (accessToken.isEmpty) {
      throw const UpstoxApiException(
        message:
            'Missing Upstox token. Add UPSTOX_ANALYTICS_ACCESS_TOKEN to .env.',
        debugDetails: 'UPSTOX_ANALYTICS_ACCESS_TOKEN is empty or missing.',
      );
    }

    final uri = Uri.parse('$baseUrl/v2/instruments/search').replace(
      queryParameters: {
        'query': query.trim().toUpperCase(),
        'exchanges': 'NSE',
        'segments': 'FO',
        'instrument_types': 'CE,PE',
        'records': '30',
      },
    );

    log(
      'Search request\n'
      'query: ${query.trim().toUpperCase()}\n'
      'endpoint: ${uri.replace(queryParameters: {'query': query.trim().toUpperCase(), 'exchanges': 'NSE', 'segments': 'FO', 'instrument_types': 'CE,PE', 'records': '30'})}\n'
      'filters: exchange=NSE, segment=FO, types=CE,PE, limit=30',
      name: 'UpstoxMarketData',
    );

    final response = await getSearchResponse(uri);

    try {
      if (response.statusCode != 200) {
        throw UpstoxApiException(
          message:
              'Upstox returned a non-200 status code: ${response.statusCode}',
          debugDetails: 'Status code: ${response.statusCode}',
        );
      }

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final data = decoded['data'] as List<dynamic>? ?? [];

      return data
          .map(
            (item) =>
                SearchOptionModel.fromUpstoxJson(item as Map<String, dynamic>),
          )
          .toList();
    } on FormatException catch (error, stackTrace) {
      log(
        'Could not decode Upstox response as JSON.\n'
        'response body: ${safeResponseBody(response.body)}',
        name: 'UpstoxMarketData',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      throw const UpstoxApiException(
        message: 'Upstox returned a response the app cannot process.',
        debugDetails: 'JSON decoding failed.',
      );
    }
  }

  // Make one search request. The user retries manually from the UI if it fails.
  Future<http.Response> getSearchResponse(Uri uri) async {
    try {
      final response = await http.get(
        uri,
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 429) {
        log(
          'Option search rate limited. ${safeResponseBody(response.body)}',
          name: 'UpstoxMarketData',
          level: 900,
        );
        throw UpstoxRateLimitException(
          debugDetails: safeResponseBody(response.body),
        );
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        log(
          'Option search HTTP response\n'
          'status: ${response.statusCode}\n'
          'content-type: ${response.headers['content-type']}\n'
          'raw JSON response:\n${response.body}',
          name: 'UpstoxMarketData',
        );
        return response;
      }

      final exception = UpstoxApiException.fromStatusCode(
        response.statusCode,
        responseBody: safeResponseBody(response.body),
      );
      log(
        'Option search failed. ${exception.debugDetails}',
        name: 'UpstoxMarketData',
        level: 1000,
      );
      throw exception;
    } on SocketException {
      const exception = UpstoxApiException(
        message: 'No internet connection. Check your network and try again.',
        debugDetails: 'SocketException while calling Upstox.',
      );
      log(exception.debugDetails!, name: 'UpstoxMarketData', level: 1000);
      throw exception;
    } on http.ClientException {
      const exception = UpstoxApiException(
        message: 'Could not reach Upstox. Please try again.',
        debugDetails: 'http.ClientException while calling Upstox.',
      );
      log(exception.debugDetails!, name: 'UpstoxMarketData', level: 1000);
      throw exception;
    }
  }

  // helper to safely log response bodies
  String safeResponseBody(String body) {
    const maxLength = 500;
    return body.length <= maxLength ? body : '${body.substring(0, maxLength)}…';
  }
}
