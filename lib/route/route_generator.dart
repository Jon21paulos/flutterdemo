import 'package:flutter/material.dart';
import 'package:simpleproject/widgets/authentication_wrapper.dart';
import 'package:simpleproject/widgets/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) => const AuthenticationWrapper());
    }
  }
}