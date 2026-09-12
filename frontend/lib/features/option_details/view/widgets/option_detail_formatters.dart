import 'package:frontend/features/option_details/model/option_market_data.dart';

class OptionFormatters {
  static String currency(double? value) {
    if (value == null) {
      return '₹ --';
    }

    return '₹ ${value.toStringAsFixed(2)}';
  }

  static String number(num? value) {
    if (value == null) {
      return '--';
    }

    final rawValue = value is int ? value.toString() : value.toStringAsFixed(0);
    return rawValue.replaceAllMapped(
      RegExp(r'(?<!^)(?=(\d{3})+$)'),
      (match) => ',',
    );
  }

  static String change(OptionDetailsMarketData? optionData) {
    if (optionData == null) {
      return '-- (--%)';
    }

    final sign = optionData.change >= 0 ? '+' : '';
    return '$sign${optionData.change.toStringAsFixed(2)} '
        '($sign${optionData.changePercentage.toStringAsFixed(2)}%)';
  }
}
