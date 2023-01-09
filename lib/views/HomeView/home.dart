import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_final/core/constants/app/app_constants.dart';
import 'package:flutter_application_final/core/extension/context_extension.dart';
import 'package:flutter_application_final/core/extension/string_extension.dart';
import 'package:flutter_application_final/core/lang/locale_keys.g.dart';
import 'package:flutter_application_final/product/widget/background_image.dart';
import 'package:flutter_application_final/product/widget/exit_dialog.dart';
import 'package:flutter_application_final/views/NewGameView/new_game.dart';
import 'package:flutter_application_final/views/SettingsView/settings.dart';

//* ANASAYFA
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, bottom: 64.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  LocaleKeys.app_name.locale,
                  style: TextStyle(
                      fontSize: AppConstants.homeHeaderTextSize,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        Shadow(
                            offset: const Offset(2.0, 1.0),
                            blurRadius: 3.0,
                            color: Theme.of(context).shadowColor),
                        Shadow(
                            offset: const Offset(2.0, 1.0),
                            blurRadius: 3.0,
                            color: Theme.of(context).shadowColor)
                      ]),
                )
                    .animate()
                    .fadeIn(duration: 1.seconds)
                    .moveY(duration: 1.seconds),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(16.0))),
                child: Column(
                  children: [
                    // ! Oyuna başlama butonu
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                        width: 2, color: Colors.white)))),
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: false,
                              isDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return MediaQuery(
                                  data: MediaQueryData.fromWindow(
                                      WidgetsBinding.instance.window),
                                  child:
                                      const SafeArea(child: GameBottomSheet()),
                                );
                              });
                        },
                        icon: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Icon(Icons.play_arrow_outlined,
                                size: context.mediumValue)),
                        label: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              LocaleKeys.app_newgame.locale,
                              style: const TextStyle(
                                  fontSize: AppConstants.fontSizeM),
                            ),
                          ),
                        )).animate().fade(duration: 600.ms, delay: 1.seconds),
                    const SizedBox(
                      height: 10,
                    ),
                    // ! Ayarlar Butonu
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                        width: 2, color: Colors.white)))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()));
                        },
                        icon: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Icon(Icons.settings,
                                size: context.mediumValue)),
                        label: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              LocaleKeys.app_settings.locale,
                              style: const TextStyle(
                                  fontSize: AppConstants.fontSizeM),
                            ),
                          ),
                        )).animate().fade(duration: 600.ms, delay: 1500.ms),
                    const SizedBox(
                      height: 10,
                    ),
                    // ! Çıkış Butonu
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: const BorderSide(
                                        width: 2, color: Colors.white)))),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const ExitDialog();
                              });
                        },
                        icon: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Icon(Icons.exit_to_app_rounded,
                                size: context.mediumValue)),
                        label: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              LocaleKeys.app_exit.locale,
                              style: const TextStyle(
                                  fontSize: AppConstants.fontSizeM),
                            ),
                          ),
                        )).animate().fade(duration: 600.ms, delay: 2.seconds),
                  ],
                ),
              ).animate().fade(delay: 1.seconds, duration: 600.ms),
            ],
          )),
        ),
      ),
    );
  }
}

class GameBottomSheet extends StatefulWidget {
  const GameBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<GameBottomSheet> createState() => _GameBottomSheetState();
}

class _GameBottomSheetState extends State<GameBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 800),
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Text(LocaleKeys.start_select_horse.locale,
                      style: const TextStyle(fontSize: 36.0)),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(LocaleKeys.select_horse.locale,
                      style: const TextStyle(fontSize: 24.0)),
                ],
              ),
              const NewGame(),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99.0),
                          side: const BorderSide(
                              width: 2, color: Colors.transparent)))),
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back, size: context.mediumValue),
                  label: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      LocaleKeys.return_home.locale,
                      style: TextStyle(fontSize: context.mediumValue),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
