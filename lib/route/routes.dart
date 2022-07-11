import 'package:flutter/material.dart';
import 'package:vipratechuserauth/features/authentication/screens/login_screen.dart';
import 'package:vipratechuserauth/features/authentication/screens/registration_screen.dart';
import 'package:vipratechuserauth/features/summary/screens/product_summary.dart';
import 'package:vipratechuserauth/route/routenames.dart';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) {
        switch (settings.name) {
          case RouteNames.loginPage:
            return const LoginScreen();
          case RouteNames.registrationScreen:
            return const RegistrationScreen();

           case RouteNames.summaryScreen:
            return const SummaryScreen();
          default:
            return throw const FormatException(
                "Route not found! check routes again");
        }
      },
    );
  }
}
