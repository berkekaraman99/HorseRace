import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get regularValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(regularValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension DurationExtension on BuildContext {
  Duration get durationLow => const Duration(milliseconds: 250);
  Duration get durationSemiLow => const Duration(seconds: 1);

  Duration get durationNormal => const Duration(seconds: 2);
  Duration get durationHigh => const Duration(seconds: 5);
}
