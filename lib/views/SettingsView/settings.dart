import 'package:flutter/material.dart';
import 'package:flutter_application_final/product/global/text_const.dart';
import 'package:flutter_application_final/product/extension/multi_languages.dart';
import 'package:flutter_application_final/product/provider/theme_notifier.dart';
import 'package:provider/provider.dart';
import '../../product/global/lang_const.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  MultiLanguages multiLanguages = MultiLanguages();

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
                    Text(' Settings',
                        style: Theme.of(context).textTheme.headline3),
                  ],
                ),
                const SizedBox(height: 12.0),
                ListTile(
                  subtitle: Text(
                    MultiLanguages.of(context)!
                        .translate('settings_update_language'),
                  ),
                  leading: const Icon(Icons.language_outlined),
                  title: Text(
                    MultiLanguages.of(context)!
                        .translate('settings_update_language'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        children: [
                          Text(
                            MultiLanguages.of(context)!
                                .translate('app_settings_select_language'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: CustomTextStyle().fontSizeM),
                          ),
                          Divider(
                            color: ThemeData().dividerColor,
                          ),
                          SizedBox(
                            height: AppLocales.locales.length * 30.0,
                            width: 200.0,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: AppLocales.locales.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    langButton(
                                        context,
                                        AppLocales.langNames[index],
                                        AppLocales.locales[index]),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8.0),
                ListTile(
                  title: Text(
                    MultiLanguages.of(context)!
                        .translate('app_settings_change_theme'),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    MultiLanguages.of(context)!
                        .translate('app_settings_change_theme'),
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

  TextButton langButton(BuildContext context, String text, Locale locale) {
    return TextButton(
        onPressed: () {
          multiLanguages.setLocale(context, locale);
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ));
  }
}

class _ChangeThemeDialog extends StatelessWidget {
  const _ChangeThemeDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      Text(
        MultiLanguages.of(context)!.translate('app_settings_select_theme'),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5,
      ),
      Divider(color: ThemeData().dividerColor),
      TextButton(
          onPressed: () {
            context.read<ThemeNotifier>().changeThemeDark();
            Navigator.pop(context);
          },
          child: Text(
            MultiLanguages.of(context)!.translate('theme_dark'),
            style: TextStyle(fontSize: CustomTextStyle().fontSizeS),
          )),
      const SizedBox(height: 16.0),
      TextButton(
          onPressed: () {
            context.read<ThemeNotifier>().changeThemeLight();
            Navigator.pop(context);
          },
          child: Text(
            MultiLanguages.of(context)!.translate('theme_light'),
            style: TextStyle(fontSize: CustomTextStyle().fontSizeS),
          ))
    ]);
  }
}
