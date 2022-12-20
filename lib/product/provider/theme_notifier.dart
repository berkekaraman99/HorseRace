import 'package:flutter/material.dart';
import 'package:flutter_application_final/product/theme/dark_theme.dart';
import 'package:flutter_application_final/product/theme/light_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeThemeLight() {
    isLightTheme = true;
    notifyListeners();
  }

  void changeThemeDark() {
    isLightTheme = false;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      isLightTheme ? LightTheme().materialTheme : DarkTheme().materialTheme;
}
