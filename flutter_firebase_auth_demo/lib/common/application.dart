import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_demo/common/common.dart';
import 'package:flutter_firebase_auth_demo/home/home_screen.dart';
import 'package:flutter_firebase_auth_demo/register/register_screen.dart';
import 'package:flutter_firebase_auth_demo/sign_in/sign_in_screen.dart';

// ignore: must_be_immutable
class Application extends StatelessWidget {
  static const String signIn = '/signIn';
  static const String home = '/home';

  var routes = <String, WidgetBuilder>{
    signIn: (BuildContext context) => SignInScreen(),
    home: (BuildContext context) => HomeScreen()
  };

  @override
  Widget build(BuildContext context) => MaterialApp(
      routes: routes,
      theme: new ThemeData(
        primarySwatch: blackMaterialColor,
      ),
      home: RegisterScreen());
}
