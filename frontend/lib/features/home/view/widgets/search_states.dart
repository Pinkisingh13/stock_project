import 'package:flutter/material.dart';

class SearchHintState extends StatelessWidget {
  const SearchHintState({
    super.key,
    this.title = 'Search options',
    this.message =
        'Start typing a NIFTY symbol or strike, such as NIFTY 24500 CE.',
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SearchIdleIllustration(),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchIdleIllustration extends StatelessWidget {
  const SearchIdleIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return SizedBox(
      height: 160,
      width: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 22,
            top: 20,
            child: SoftCircle(color: primary.withValues(alpha: 0.10), size: 88),
          ),
          Positioned(
            right: 26,
            bottom: 20,
            child: SoftCircle(color: primary.withValues(alpha: 0.14), size: 54),
          ),
          Positioned(
            right: 38,
            top: 28,
            child: Icon(
              Icons.auto_awesome_rounded,
              color: primary.withValues(alpha: 0.55),
              size: 22,
            ),
          ),
          Container(
            height: 112,
            width: 130,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: primary.withValues(alpha: 0.18)),
              boxShadow: [
                BoxShadow(
                  color: primary.withValues(alpha: 0.10),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Candlestick(
                      color: primary.withValues(alpha: 0.68),
                      bodyHeight: 34,
                      bodyTop: 28,
                    ),
                    const SizedBox(width: 12),
                    Candlestick(color: primary, bodyHeight: 48, bodyTop: 18),
                    const SizedBox(width: 12),
                    Candlestick(
                      color: primary.withValues(alpha: 0.78),
                      bodyHeight: 28,
                      bodyTop: 35,
                    ),
                  ],
                ),
                const Positioned(
                  right: 12,
                  bottom: 10,
                  child: Icon(Icons.search_rounded, size: 22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Candlestick extends StatelessWidget {
  const Candlestick({
    super.key,
    required this.color,
    required this.bodyHeight,
    required this.bodyTop,
  });

  final Color color;
  final double bodyHeight;
  final double bodyTop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      width: 20,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 4,
            height: 84,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Positioned(
            top: bodyTop,
            child: Container(
              height: bodyHeight,
              width: 18,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SoftCircle extends StatelessWidget {
  const SoftCircle({super.key, required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class EmptySearchState extends StatelessWidget {
  const EmptySearchState({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off_outlined, size: 48),
            const SizedBox(height: 12),
            Text(
              'No matching option found',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'No NSE F&O option matched “${query.trim()}”.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchErrorState extends StatelessWidget {
  const SearchErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          color: colors.errorContainer,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  Icons.cloud_off_outlined,
                  size: 40,
                  color: colors.onErrorContainer,
                ),
                const SizedBox(height: 12),
                Text(
                  'Search unavailable',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: colors.onErrorContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(color: colors.onErrorContainer),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => onRetry(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Retry search'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
