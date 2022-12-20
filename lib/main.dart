import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/product/global/lang_const.dart';
import 'package:flutter_application_final/views/HomeView/home.dart';
import 'package:flutter_application_final/product/extension/multi_languages.dart';
import 'package:flutter_application_final/product/provider/theme_notifier.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeNotifier>(
        create: ((context) => ThemeNotifier()))
  ], builder: (context, child) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale.fromSubtags(languageCode: 'en');

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final multiLanguages = MultiLanguages();
    final localeKey = await multiLanguages.readLocaleKey();
    _changleLocale(localeKey);
  }

  void _changleLocale(String localeKey) {
    switch (localeKey) {
      case 'de':
        _locale = const Locale('de', 'DE');
        break;
      case 'en':
        _locale = const Locale('en', 'US');
        break;
      case 'es':
        _locale = const Locale('es', 'ES');
        break;
      case 'fr':
        _locale = const Locale('fr', 'FR');
        break;
      case 'pt':
        _locale = const Locale('pt', 'PT');
        break;
      case 'sv':
        _locale = const Locale('sv', 'SE');
        break;
      case 'tr':
        _locale = const Locale('tr', 'TR');
        break;
      default:
        if (kDebugMode) {
          print("Locale not found");
        }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocales.locales,
      localizationsDelegates: const [
        MultiLanguages.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale?.languageCode &&
              supportedLocaleLanguage.countryCode == locale?.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
      title: 'Horse Race',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
