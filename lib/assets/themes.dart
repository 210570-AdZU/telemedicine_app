import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light(
    secondary: Colors.blueAccent,
  ),
  textTheme: TextTheme(
    headlineSmall: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black54, fontSize: 13),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueGrey,
    textTheme: ButtonTextTheme.primary,
  ),
  iconTheme: IconThemeData(
    color: Colors.blueGrey,
  ),
);
