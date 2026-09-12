import 'package:flutter/material.dart';
import 'package:frontend/features/auth/view/login_screen.dart';
import 'package:frontend/features/auth/view/register_screen.dart';
import 'package:frontend/features/home/view/search_screen.dart';
import 'package:frontend/features/option_details/view/option_detail_screen.dart';

const loginRoute = '/login';
const registerRoute = '/register';
const searchRoute = '/search';
const optionDetailRoute = '/option-detail';

final Map<String, WidgetBuilder> appRoutes = {
  loginRoute: (context) => const LoginScreen(),
  registerRoute: (context) => const RegisterScreen(),
  searchRoute: (context) => const SearchScreen(),
  optionDetailRoute: (context) => const OptionDetailScreen(),
};
