import 'package:flutter/material.dart';
import 'package:frontend/features/option_details/controller/option_details_controller.dart';
import 'package:frontend/features/option_details/view/widgets/option_detail_formatters.dart';
import 'package:frontend/features/option_details/view/widgets/option_detail_widgets.dart';
import 'package:frontend/shared/widgets/template.dart';
import 'package:provider/provider.dart';

class OptionDetailScreen extends StatefulWidget {
  const OptionDetailScreen({super.key});

  @override
  State<OptionDetailScreen> createState() => OptionDetailScreenState();
}

class OptionDetailScreenState extends State<OptionDetailScreen> {
  late final OptionDetailsController optionDetailsController;

  @override
  void initState() {
    super.initState();
    optionDetailsController = context.read<OptionDetailsController>();
    optionDetailsController.connectOptionData();
  }

  @override
  void dispose() {
    optionDetailsController.disconnectOptionData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OptionDetailsController>(
      builder: (context, optionDetails, child) {
        
        final option = optionDetails.selectedOption;

        if (option == null) {
          return AppTemplate(
            title: 'Option Detail',
            onBack: () => Navigator.of(context).pop(),
            body: const Center(
              child: Text('Select an option from search to view its details.'),
            ),
          );
        }

        return AppTemplate(
          title: 'Option Detail',
          onBack: () => Navigator.of(context).pop(),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
            children: [
              OptionInstrumentHeader(option: option),
              const SizedBox(height: 20),

              if (!optionDetails.hasLiveOptionData)
                OptionLiveStatus(
                  isLoading: optionDetails.isLoadingOptionData,
                  isRetrying: optionDetails.isRetrying,
                  retryCount: optionDetails.retryCount,
                  errorMessage: optionDetails.errorMessage,
                ),
                
              if (optionDetails.errorMessage != null) ...[
                const SizedBox(height: 12),
                OptionLiveErrorCard(
                  message: optionDetails.errorMessage!,
                  onRetry: optionDetails.connectOptionData,
                ),
              ],
              const SizedBox(height: 16),
              OptionLtpCard(optionData: optionDetails.optionData),
              const SizedBox(height: 20),
              Text('Market depth', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OptionQuoteCard(
                      label: 'Best bid',
                      priceLabel: 'Bid price',
                      quantityLabel: 'Bid quantity',
                      color: Colors.green,
                      icon: Icons.south_west_rounded,
                      price: optionDetails.optionData?.bidPrice,
                      quantity: optionDetails.optionData?.bidQuantity,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OptionQuoteCard(
                      label: 'Best ask',
                      priceLabel: 'Ask price',
                      quantityLabel: 'Ask quantity',
                      color: Colors.red,
                      icon: Icons.north_east_rounded,
                      price: optionDetails.optionData?.askPrice,
                      quantity: optionDetails.optionData?.askQuantity,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Performance', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OptionActivityCard(
                      label: 'Open',
                      value: OptionFormatters.currency(
                        optionDetails.optionData?.open,
                      ),
                      icon: Icons.wb_sunny_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OptionActivityCard(
                      label: 'Previous close',
                      value: OptionFormatters.currency(
                        optionDetails.optionData?.previousClose,
                      ),
                      icon: Icons.history_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OptionActivityCard(
                      label: 'Lot size',
                      value: option.lotSize == null
                          ? '--'
                          : '${option.lotSize} Qty',
                      icon: Icons.layers_outlined,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OptionActivityCard(
                      label: 'Volume',
                      value: OptionFormatters.number(
                        optionDetails.optionData?.volume,
                      ),
                      icon: Icons.bar_chart_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              OptionActivityCard(
                label: 'Open interest',
                value: OptionFormatters.number(
                  optionDetails.optionData?.openInterest,
                ),
                icon: Icons.pie_chart_outline_rounded,
              ),
              const SizedBox(height: 20),
              Text('Order totals', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OptionActivityCard(
                      label: 'Total bid quantity',
                      value: OptionFormatters.number(
                        optionDetails.optionData?.totalBidQuantity,
                      ),
                      icon: Icons.south_west_rounded,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OptionActivityCard(
                      label: 'Total ask quantity',
                      value: OptionFormatters.number(
                        optionDetails.optionData?.totalAskQuantity,
                      ),
                      icon: Icons.north_east_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                optionDetails.hasLiveOptionData
                    ? 'Values update automatically as live ticks arrive.'
                    : 'Live values will appear after the broker feed connects.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
