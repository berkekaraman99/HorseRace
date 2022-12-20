import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_final/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiLanguages {
  final Locale locale;
  MultiLanguages({this.locale = const Locale.fromSubtags(languageCode: 'en')});

  static MultiLanguages? of(BuildContext context) {
    return Localizations.of<MultiLanguages>(context, MultiLanguages);
  }

  void keepLocaleKey(String localeKey) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.remove(localeKey);
    await _prefs.setString('localeKey', localeKey);
  }

  Future<String> readLocaleKey() async {
    final _prefs = await SharedPreferences.getInstance();

    return _prefs.getString('localeKey') ?? 'en';
  }

  void setLocale(BuildContext context, Locale locale) async {
    keepLocaleKey(locale.languageCode);
    // if (kDebugMode) {
    //   print('key language :${locale.languageCode}');
    // }
    MyApp.setLocale(context, locale);
  }

  static const LocalizationsDelegate<MultiLanguages> delegate =
      _MultiLanguagesDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? 'null';
  }

  String translateWithIndex(String key, int index) {
    return _localizedStrings[key]?[index] ?? 'null';
  }
}

class _MultiLanguagesDelegate extends LocalizationsDelegate<MultiLanguages> {
  // This delegate instance will never change
  // It can provide a constant constructor.
  const _MultiLanguagesDelegate();
  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'tr', 'de', 'fr', 'sv', 'es', 'pt']
        .contains(locale.languageCode);
  }

  /// read Json
  @override
  Future<MultiLanguages> load(Locale locale) async {
    // MultiLanguages class is where the JSON loading actually runs
    MultiLanguages localizations = MultiLanguages(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MultiLanguagesDelegate old) => false;
}
