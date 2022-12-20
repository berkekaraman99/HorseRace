import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get materialTheme {
    return ThemeData(
        fontFamily: 'VT',
        brightness: Brightness.light,
        primaryColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, elevation: 0)));
  }
}
