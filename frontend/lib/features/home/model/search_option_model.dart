class SearchOptionModel {
  const SearchOptionModel({
    required this.instrumentKey,
    required this.symbol,
    required this.strike,
    required this.expiry,
    required this.optionType,
    this.lotSize,
  });

  final String instrumentKey;
  final String symbol;
  final double strike;
  final String expiry;
  final String optionType;
  final int? lotSize;

  factory SearchOptionModel.fromUpstoxJson(Map<String, dynamic> json) {
    final tradingSymbol = (json['trading_symbol'] ?? json['symbol'] ?? '')
        .toString();

    return SearchOptionModel(
      instrumentKey: (json['instrument_key'] ?? '').toString(),
      symbol: tradingSymbol,
      strike: toDouble(json['strike_price']),
      expiry: formatExpiry(json['expiry']),
      optionType: (json['instrument_type'] ?? '').toString(),
      lotSize: toInt(json['lot_size']),
    );
  }

  static double toDouble(dynamic value) =>
      value is num ? value.toDouble() : double.tryParse('$value') ?? 0;

  static int? toInt(dynamic value) =>
      value is num ? value.toInt() : int.tryParse('$value');

  static String formatExpiry(dynamic value) {
    final rawExpiry = (value ?? '').toString();
    final parsed = DateTime.tryParse(rawExpiry);

    if (parsed == null) {
      return rawExpiry.isEmpty ? 'Expiry unavailable' : rawExpiry;
    }

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${parsed.day.toString().padLeft(2, '0')} '
        '${months[parsed.month - 1]} ${parsed.year}';
  }
}
