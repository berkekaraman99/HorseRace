import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData get materialTheme {
    return ThemeData(
        fontFamily: 'Quicksand',
        textTheme: const TextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        primaryColor: Colors.white,
        shadowColor: Colors.black,
        dividerColor: Colors.white,
        dialogTheme: const DialogTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        brightness: Brightness.dark,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Colors.deepPurpleAccent)),
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(40.0)))));
  }
}
