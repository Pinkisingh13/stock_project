import 'package:flutter/material.dart';
import 'package:frontend/core/routes/app_routes.dart';
import 'package:frontend/features/home/controller/option_search_controller.dart';
import 'package:frontend/features/option_details/controller/option_details_controller.dart';
import 'package:frontend/features/home/model/search_option_model.dart';
import 'package:provider/provider.dart';

class OptionResultCard extends StatelessWidget {
  const OptionResultCard({super.key, required this.option});

  final SearchOptionModel option;

  @override
  Widget build(BuildContext context) {

    final isCall = option.optionType == 'CE';
    final typeColor = isCall ? Colors.teal : Colors.deepOrange;

    return Card(
      clipBehavior: Clip.antiAlias,
      
      child: InkWell(
        onTap: () {
          context.read<OptionSearchController>().clear();
          FocusScope.of(context).unfocus();
          context.read<OptionDetailsController>().selectOption(option);
          Navigator.of(context).pushNamed(optionDetailRoute);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: typeColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  option.optionType,
                  style: TextStyle(
                    color: typeColor.shade700,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      option.symbol,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: [
                        InfoPill(
                          icon: Icons.calendar_today_outlined,
                          label: option.expiry,
                        ),
                        InfoPill(
                          icon: Icons.adjust_outlined,
                          label: 'Strike ${option.strike.toInt()}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPill extends StatelessWidget {
  const InfoPill({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}
