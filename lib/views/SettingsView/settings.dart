import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/extension/context_extension.dart';
import 'package:flutter_application_final/core/extension/string_extension.dart';
import 'package:flutter_application_final/core/lang/lang_manager.dart';
import 'package:flutter_application_final/core/lang/locale_keys.g.dart';
import 'package:flutter_application_final/product/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

//* AYARLAR
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back)),
                    ),
                    Text(' ${LocaleKeys.settings.locale}',
                        style: context.textTheme.headline4
                            ?.copyWith(fontWeight: FontWeight.w600))
                  ],
                ),
                const SizedBox(height: 12.0),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: Text(
                      LocaleKeys.settings_update_language.locale,
                      style: context.textTheme.headline5,
                    ),
                    // subtitle: Text(
                    //   LocaleKeys.settings_update_language.locale,
                    // ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const _ChangeLanguageDialog();
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.sunny),
                    title: Text(
                      LocaleKeys.app_settings_change_theme.locale,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    // subtitle: Text(
                    //   LocaleKeys.app_settings_change_theme.locale,
                    // ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const _ChangeThemeDialog();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

enum LanguageCodes { en, tr, de }

class _ChangeLanguageDialog extends StatelessWidget {
  const _ChangeLanguageDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              LocaleKeys.app_settings_select_language.locale,
              textAlign: TextAlign.center,
              style: context.textTheme.headline4
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Divider(
          indent: 8.0,
          endIndent: 8.0,
          color: context.theme.dividerColor,
          thickness: 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
              width: 250.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      "English",
                      style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: context.regularValue),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      EasyLocalization.of(context)!
                          .setLocale(LanguageManager.instance.enLocale);
                    },
                  ),
                  ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      "Türkçe",
                      style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: context.regularValue),
                    ),
                    onTap: () {
                      EasyLocalization.of(context)!
                          .setLocale(LanguageManager.instance.trLocale);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      textAlign: TextAlign.center,
                      "Deutsch",
                      style: TextStyle(
                          color: context.theme.primaryColor,
                          fontSize: context.regularValue),
                    ),
                    onTap: () {
                      EasyLocalization.of(context)!
                          .setLocale(LanguageManager.instance.deLocale);
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class _ChangeThemeDialog extends StatelessWidget {
  const _ChangeThemeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            LocaleKeys.app_settings_select_theme.locale,
            textAlign: TextAlign.center,
            style: context.textTheme.headline4
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Divider(
        indent: 8.0,
        endIndent: 8.0,
        color: context.theme.dividerColor,
        thickness: 0.1,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                textAlign: TextAlign.center,
                LocaleKeys.theme_dark.locale,
                style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: context.regularValue),
              ),
              onTap: () {
                context.read<ThemeNotifier>().changeThemeDark();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                textAlign: TextAlign.center,
                LocaleKeys.theme_light.locale,
                style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: context.regularValue),
              ),
              onTap: () {
                context.read<ThemeNotifier>().changeThemeLight();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ]);
  }
}
