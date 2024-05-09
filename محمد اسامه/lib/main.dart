import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled1/core/services/loading_service.dart';
import 'package:untitled1/core/theme/application_theme.dart';
import 'package:untitled1/pages/home_screen/four.dart';
import 'package:untitled1/pages/login_screen/login_screen.dart';
import 'package:untitled1/pages/onBoarding_screens/onboarding_screens.dart';
import 'package:untitled1/pages/register_screen/register_screen.dart';
import 'package:untitled1/pages/splash_screen/splash_screen.dart';
import 'package:untitled1/store.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
    /*  routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnBoarding.routeName: (context) => const OnBoarding(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        DetailsScreen.routeName: (context) => const DetailsScreen(),
        Four.routeName :(context)=> const Four(),
      },*/
      home:SplashScreen(),
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
      theme: ApplicationTheme.appTheme,
    );
  }
}
