import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get materialTheme {
    return ThemeData(
        fontFamily: 'Quicksand',
        brightness: Brightness.light,
        primaryColor: Colors.black,
        shadowColor: Colors.white,
        dividerColor: Colors.black,
        dialogTheme: const DialogTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, elevation: 0)),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(40.0)))));
  }
}
