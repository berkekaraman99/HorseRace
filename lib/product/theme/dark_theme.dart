import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData get materialTheme {
    return ThemeData(
        fontFamily: 'VT',
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(elevation: 0)));
  }
}
