import 'package:flutter/material.dart';
import 'package:proto/view/home_screen.dart';
import 'package:proto/view/login_screen.dart';
import 'package:proto/view/sign_up_screen.dart';

class AppRoutes {
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String homeScreen = "/homeScreen";
}

class OnGenerateRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/loginScreen":
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);
      case "/signUpScreen":
        return MaterialPageRoute(
            builder: (_) => SignupScreen(), settings: settings);
      case "/homeScreen":
        return MaterialPageRoute(
            builder: (_) => HomeScreen(), settings: settings);
      /*case "/qrScannerScreen":
        return MaterialPageRoute(
            builder: (_) {
              final args = settings.arguments as List<dynamic>;
              return QrScannerScreen(
                isFromOnBoarding: args[0],
                isSignedQR: args[1],
              );
            },
            settings: settings);*/
    }
    return null;
  }
}
