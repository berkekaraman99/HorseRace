import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/constants/app/app_constants.dart';
import 'package:flutter_application_final/core/lang/lang_manager.dart';
import 'package:flutter_application_final/product/provider/providers.dart';
import 'package:flutter_application_final/views/HomeView/home.dart';
import 'package:flutter_application_final/product/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
    providers: ApplicationProvider.instance.providers,
    child: EasyLocalization(
        path: AppConstants.LANG_ASSET_PATH,
        supportedLocales: LanguageManager.instance.supportedLocales,
        child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'Horse Race',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
