import 'package:flutter/material.dart';
import 'package:frontend/features/auth/controller/auth_controller.dart';
import 'package:provider/provider.dart';

class AppTemplate extends StatelessWidget {
  const AppTemplate({
    super.key,
    required this.title,
    required this.body,
    this.onBack,
  });

  final String title;
  final Widget body;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        titleSpacing: onBack == null ? 20 : 4,
        leading: onBack == null
            ? null
            : IconButton(
                tooltip: 'Back',
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back),
              ),
        title: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.candlestick_chart_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 21,
              ),
            ),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        actions: onBack == null
            ? [
                IconButton(
                  tooltip: 'Sign out',
                  onPressed: () => context.read<AuthController>().signOut(),
                  icon: const Icon(Icons.logout_rounded),
                ),
                const SizedBox(width: 8),
              ]
            : null,
      ),
      body: SafeArea(child: body),
    );
  }
}
