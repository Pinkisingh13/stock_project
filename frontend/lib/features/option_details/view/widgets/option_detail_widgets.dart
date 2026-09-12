import 'package:flutter/material.dart';
import 'package:frontend/features/home/model/search_option_model.dart';
import 'package:frontend/features/option_details/model/option_market_data.dart';
import 'package:frontend/features/option_details/view/widgets/option_detail_formatters.dart';

class OptionInstrumentHeader extends StatelessWidget {
  const OptionInstrumentHeader({super.key, required this.option});

  final SearchOptionModel option;

  @override
  Widget build(BuildContext context) {
    final typeColor = option.optionType == 'CE' ? Colors.green : Colors.red;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    option.symbol,
                    style: Theme.of(context).textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: typeColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    option.optionType,
                    style: TextStyle(
                      color: typeColor.shade700,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                InstrumentInfo(
                  icon: Icons.calendar_today_outlined,
                  value: option.expiry,
                ),
                InstrumentInfo(
                  icon: Icons.adjust_outlined,
                  value: 'Strike ${option.strike.toInt()}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InstrumentInfo extends StatelessWidget {
  const InstrumentInfo({super.key, required this.icon, required this.value});

  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 6),
        Text(value, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class OptionLiveStatus extends StatelessWidget {
  const OptionLiveStatus({
    super.key,
    required this.isLoading,
    required this.isRetrying,
    required this.retryCount,
    required this.errorMessage,
  });

  final bool isLoading;
  final bool isRetrying;
  final int retryCount;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    var color = colorScheme.outline;
    var label = 'Waiting for feed';

    if (isRetrying) {
      color = colorScheme.tertiary;
      label = 'Retrying ($retryCount/3)';
    } else if (errorMessage != null) {
      color = colorScheme.error;
      label = 'Connection error';
    } else if (isLoading) {
      color = colorScheme.tertiary;
      label = 'Connecting';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Market data status',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 8),
        Icon(Icons.circle, color: color, size: 10),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(color: color),
        ),
      ],
    );
  }
}

class OptionLiveErrorCard extends StatelessWidget {
  const OptionLiveErrorCard({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: colorScheme.error),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodySmall
                  ?.copyWith(color: colorScheme.onErrorContainer),
            ),
          ),
          TextButton(
            onPressed: () => onRetry(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

class OptionLtpCard extends StatelessWidget {
  const OptionLtpCard({super.key, required this.optionData});

  final OptionDetailsMarketData? optionData;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isPositive = optionData?.change == null || optionData!.change >= 0;
    final changeColor = isPositive
        ? Colors.green.shade700
        : Colors.red.shade700;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last traded price',
                  style: Theme.of(context).textTheme.labelLarge
                      ?.copyWith(color: colorScheme.onPrimaryContainer),
                ),
                const SizedBox(height: 8),
                Text(
                  OptionFormatters.currency(optionData?.ltp),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 54,
            color: colorScheme.onPrimaryContainer.withValues(alpha: 0.2),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Change',
                style: Theme.of(context).textTheme.labelLarge
                    ?.copyWith(color: colorScheme.onPrimaryContainer),
              ),
              const SizedBox(height: 8),
              Text(
                OptionFormatters.change(optionData),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: optionData == null
                      ? colorScheme.onPrimaryContainer
                      : changeColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class OptionQuoteCard extends StatelessWidget {
  const OptionQuoteCard({
    super.key,
    required this.label,
    required this.priceLabel,
    required this.quantityLabel,
    required this.color,
    required this.icon,
    required this.price,
    required this.quantity,
  });

  final String label;
  final String priceLabel;
  final String quantityLabel;
  final MaterialColor color;
  final IconData icon;
  final double? price;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color.shade700, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: color.shade700,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(priceLabel, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: 4),
            Text(
              OptionFormatters.currency(price),
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Text(
              '$quantityLabel  ${OptionFormatters.number(quantity)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class OptionActivityCard extends StatelessWidget {
  const OptionActivityCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
            const SizedBox(height: 14),
            Text(label, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
