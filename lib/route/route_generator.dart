import 'package:flutter/material.dart';
import 'package:simpleproject/widgets/about_screen.dart';
import 'package:simpleproject/widgets/contact_screen.dart';
import 'package:simpleproject/widgets/signin_screen.dart';
import 'package:simpleproject/widgets/signup_screen.dart';

class RouteGenerator  {
  static Route<dynamic> generateRoute(RouteSettings settings){
  final args = settings.arguments;
  switch(settings.name){
    case '/':
      return MaterialPageRoute(builder: (_) =>const SignInPage());
    case '/signup':
      return MaterialPageRoute(builder: (_) =>const SignUpPage());

    case '/about':
      return MaterialPageRoute(builder: (_) => const AboutPage());

    case '/contact':
      return MaterialPageRoute(builder: (_) =>const ContactPage());

    default:
      return _errorRoute();
  }
}
static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar:  AppBar(
          title: const Text('error'),
        ),
        body: const Center(
          child: Text('error'),
        ),
      );
    });
}
}