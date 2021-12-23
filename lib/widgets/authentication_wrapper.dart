import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/store/connectivity_provider.dart';
import 'package:simpleproject/widgets/home_screen.dart';
import 'package:simpleproject/widgets/no_internet.dart';
import 'package:simpleproject/widgets/signin_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if(context.watch<ConnectivityProvider>().isOnline){
      if (firebaseUser != null) {
        return const HomeScreen();
      }else{
        return const SignInScreen();
      }
    }else{
      return const NoInternet();
    }

  }
}