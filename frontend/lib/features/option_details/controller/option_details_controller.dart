import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:frontend/core/errors/upstox_exception.dart';
import 'package:frontend/features/home/model/search_option_model.dart';
import 'package:frontend/features/option_details/model/option_market_data.dart';
import 'package:frontend/services/upstox_web_socket_service.dart';

class OptionDetailsController extends ChangeNotifier {
  final UpstoxWebSocketService optionWebSocketService =
      UpstoxWebSocketService();

  SearchOptionModel? selectedOption;
  OptionDetailsMarketData? optionData;
  bool isLoadingOptionData = false;
  bool hasLiveOptionData = false;
  String? errorMessage;

  static const maxRetryCount = 3;
  static const retryDelaysInSeconds = [2, 6, 10];
  Timer? retryTimer;
  bool isRetrying = false;
  int retryCount = 0;

  void selectOption(SearchOptionModel option) {
    cancelRetry();
    selectedOption = option;
    optionData = null;
    isLoadingOptionData = false;
    hasLiveOptionData = false;
    retryCount = 0;
    errorMessage = null;
    notifyListeners();
  }

  Future<void> connectOptionData({bool isRetry = false}) async {
    
    if (!isRetry) {
      retryCount = 0;
    }

    final option = selectedOption;

    if (option == null) {
      return;
    }

    cancelRetry();

    await resetConnection(notify: false);

    optionData = null;
    isLoadingOptionData = true;
    hasLiveOptionData = false;
    errorMessage = null;
    notifyListeners();

    try {
      await optionWebSocketService.openOptionWebSocket(
        option,
        onOptionData: (newOptionData) {
          optionData = newOptionData;
          isLoadingOptionData = false;
          hasLiveOptionData = true;
          retryCount = 0;
          errorMessage = null;
          notifyListeners();
        },
        onConnectionError: handleOptionDataError,
      );
    } on UpstoxApiException catch (error) {
      handleOptionDataError(error);
    }
  }

  Future<void> disconnectOptionData() async {
    cancelRetry();
    await resetConnection();
  }

  Future<void> resetConnection({bool notify = true}) async {
    await optionWebSocketService.closeOptionWebSocket();
    isLoadingOptionData = false;
    hasLiveOptionData = false;
    if (notify) {
      notifyListeners();
    }
  }

  void handleOptionDataError(UpstoxApiException error) {
    isLoadingOptionData = false;
    hasLiveOptionData = false;
    errorMessage = error.message;
    notifyListeners();
    scheduleRetry();
  }

  void scheduleRetry() {
    if (retryTimer != null || retryCount >= maxRetryCount) {
      return;
    }

    retryCount++;
    final retryDelay = Duration(seconds: retryDelaysInSeconds[retryCount - 1]);

    isRetrying = true;
    errorMessage =
        'Connection lost. Retrying in ${retryDelay.inSeconds} seconds '
        '($retryCount/$maxRetryCount).';
    notifyListeners();

    retryTimer = Timer(retryDelay, () {
      retryTimer = null;
      isRetrying = false;
      connectOptionData(isRetry: true);
    });
  }

  void cancelRetry() {
    retryTimer?.cancel();
    retryTimer = null;
    isRetrying = false;
  }

  @override
  void dispose() {
    cancelRetry();
    optionWebSocketService.dispose();
    super.dispose();
  }
}
