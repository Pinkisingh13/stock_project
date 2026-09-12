import 'package:flutter/material.dart';
import 'package:frontend/features/auth/controller/auth_controller.dart';
import 'package:frontend/features/home/view/search_screen.dart';
import 'package:frontend/features/auth/view/login_screen.dart';
import 'package:provider/provider.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    if (authController.isCheckingSession) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return authController.currentUser != null ? const SearchScreen() : const LoginScreen();
  }
}
