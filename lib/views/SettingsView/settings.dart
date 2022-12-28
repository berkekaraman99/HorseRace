import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/extension/context_extension.dart';
import 'package:flutter_application_final/core/extension/string_extension.dart';
import 'package:flutter_application_final/core/lang/lang_manager.dart';
import 'package:flutter_application_final/core/lang/locale_keys.g.dart';
import 'package:flutter_application_final/product/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

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
                            ?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 12.0),
                ListTile(
                  subtitle: Text(
                    LocaleKeys.settings_update_language.locale,
                  ),
                  leading: const Icon(Icons.language_outlined),
                  title: Text(
                    LocaleKeys.settings_update_language.locale,
                    style: context.textTheme.headline5,
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return const _ChangeLanguageDialog();
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  title: Text(
                    LocaleKeys.app_settings_change_theme.locale,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    LocaleKeys.app_settings_change_theme.locale,
                  ),
                  leading: const Icon(Icons.sunny),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return const _ChangeThemeDialog();
                    },
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
              style: context.textTheme.headline3,
            ),
          ),
        ),
        Divider(
          indent: 8.0,
          endIndent: 8.0,
          color: context.theme.dividerColor,
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
              width: 250.0,
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: TextButton(
                        onPressed: () {
                          EasyLocalization.of(context)!
                              .setLocale(LanguageManager.instance.enLocale);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "English",
                            style: TextStyle(
                                color: context.theme.primaryColor,
                                fontSize: context.regularValue),
                          ),
                        )),
                  ),
                  const SizedBox(height: 16.0),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: TextButton(
                        onPressed: () {
                          EasyLocalization.of(context)!
                              .setLocale(LanguageManager.instance.trLocale);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Türkçe",
                            style: TextStyle(
                                color: context.theme.primaryColor,
                                fontSize: context.regularValue),
                          ),
                        )),
                  ),
                  const SizedBox(height: 16.0),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: TextButton(
                        onPressed: () {
                          EasyLocalization.of(context)!
                              .setLocale(LanguageManager.instance.deLocale);
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Deutsch",
                            style: TextStyle(
                                color: context.theme.primaryColor,
                                fontSize: context.regularValue),
                          ),
                        )),
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
            style: context.textTheme.headline3,
          ),
        ),
      ),
      Divider(
        indent: 8.0,
        endIndent: 8.0,
        color: context.theme.dividerColor,
        thickness: 0.5,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  context.read<ThemeNotifier>().changeThemeDark();
                  Navigator.pop(context);
                },
                child: Text(
                  LocaleKeys.theme_dark.locale,
                  style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: context.regularValue),
                )),
            const SizedBox(height: 16.0),
            TextButton(
                onPressed: () {
                  context.read<ThemeNotifier>().changeThemeLight();
                  Navigator.pop(context);
                },
                child: Text(
                  LocaleKeys.theme_light.locale,
                  style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: context.regularValue),
                ))
          ],
        ),
      ),
    ]);
  }
}
