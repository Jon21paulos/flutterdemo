import 'package:flutter/material.dart';


ThemeData light = ThemeData(

  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  // accentColor: Colors.pink,
  // scaffoldBackgroundColor:const Color(0xfff1f1f1)

  scaffoldBackgroundColor: Colors.white,
  accentColor: const Color(0xfff5f8fd),
  primaryColorLight: Colors.grey[300],
  primaryColorDark: Colors.blue[50],
  buttonColor: Colors.blue,
  accentColorBrightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.white,
    onPrimary: Colors.white,
    primaryVariant: Colors.white38,
    secondary: Colors.red,
  ),
  cardTheme: const CardTheme(
    color: Color(0xfff5f8fd),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.black87,
    ),
    headline1: TextStyle(
      color: Colors.black87,
    ),
    headline6: TextStyle(color: Colors.black87),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue, foregroundColor: Colors.white),
);

ThemeData dark = ThemeData(

  // brightness: Brightness.dark,
  // primarySwatch: Colors.indigo,
  // accentColor: Colors.pink,

  scaffoldBackgroundColor: Colors.black,
  accentColor: Colors.grey[900],
  primaryColorLight: Colors.grey[900],
  primaryColorDark: Colors.grey[700],
  buttonColor: Colors.black,
  accentColorBrightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.black,
    primaryVariant: Colors.black,
    secondary: Colors.black45,
  ),
  cardTheme: const CardTheme(
    color: Color(0xfff5f8fd),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white70,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      color: Colors.white70,
    ),
    headline1: TextStyle(
      color: Colors.white,
    ),
    headline6: TextStyle(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);

//   );
// }