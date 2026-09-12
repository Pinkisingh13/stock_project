class UpstoxApiException implements Exception {
  const UpstoxApiException({
    required this.message,
    this.statusCode,
    this.debugDetails,
  });

  final String message;
  final int? statusCode;
  final String? debugDetails;

  factory UpstoxApiException.fromStatusCode(
    int statusCode, {
    String? responseBody,
  }) {
    final debugDetails = responseBody == null || responseBody.isEmpty
        ? 'HTTP $statusCode'
        : 'HTTP $statusCode: $responseBody';

    switch (statusCode) {
      case 400:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'The search request is invalid. Please try again.',
          debugDetails: debugDetails,
        );
      case 401:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'Your Upstox access token is missing, invalid, or expired.',
          debugDetails: debugDetails,
        );
      case 403:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'Your Upstox account does not have access to this data.',
          debugDetails: debugDetails,
        );
      case 404:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'The requested Upstox resource was not found.',
          debugDetails: debugDetails,
        );
      case 405:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'The Upstox request configuration is not supported.',
          debugDetails: debugDetails,
        );
      case 406:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'Upstox returned a response the app cannot process.',
          debugDetails: debugDetails,
        );
      case 410:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'This Upstox service is no longer available.',
          debugDetails: debugDetails,
        );
      case 429:
        return UpstoxRateLimitException(debugDetails: debugDetails);
      case 500:
      case 503:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'Upstox is temporarily unavailable. Please try again later.',
          debugDetails: debugDetails,
        );
      default:
        return UpstoxApiException(
          statusCode: statusCode,
          message: 'Unable to search options right now. Please try again.',
          debugDetails: debugDetails,
        );
    }
  }

  @override
  String toString() =>
      'UpstoxApiException(statusCode: $statusCode, message: $message)';
}

class UpstoxRateLimitException extends UpstoxApiException {
  const UpstoxRateLimitException({super.debugDetails})
    : super(
        statusCode: 429,
        message: 'Too many requests. Please retry your search in a moment.',
      );
}

class UpstoxWebSocketException extends UpstoxApiException {
  const UpstoxWebSocketException({
    required super.message,
    super.debugDetails,
  }) : super(statusCode: null);

  const UpstoxWebSocketException.connectionClosed()
    : this(
        message: 'The live market-data connection was closed.',
        debugDetails: 'WebSocket closed by server.',
      );

  const UpstoxWebSocketException.decodingFailed()
    : this(
        message: 'Could not process the live market-data response.',
        debugDetails: 'Protobuf decoding failed.',
      );
}
