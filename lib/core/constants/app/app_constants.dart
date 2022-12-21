// ignore_for_file: constant_identifier_names

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  static const String APP_NAME = "Horse Race";
  static const LANG_ASSET_PATH = "assets/lang";
  static const String APP_VERSION = "1.0.0";

  static const double textSize = 24.0;
  static const double homeHeaderTextSize = 48.0;
  static const double fontSizeHeader = 48.0;
  static const double fontSizeL = 36.0;
  static const double fontSizeM = 28.0;
  static const double fontSizeS = 20.0;
}
