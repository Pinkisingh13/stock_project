import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/core/routes/app_routes.dart';
import 'package:frontend/core/theme/app_theme.dart';
import 'package:frontend/features/auth/controller/auth_controller.dart';
import 'package:frontend/features/home/controller/option_search_controller.dart';
import 'package:frontend/features/option_details/controller/option_details_controller.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/shared/widgets/authgate.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider(create: (context) => OptionSearchController()),
        ChangeNotifierProvider(create: (context) => OptionDetailsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nifty Options Tracker',
        theme: AppTheme.theme,

        routes: appRoutes,
        home: AuthGate(),
      ),
    );
  }
}
