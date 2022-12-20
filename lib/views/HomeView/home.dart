import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_final/product/global/text_const.dart';
import 'package:flutter_application_final/product/extension/multi_languages.dart';
import 'package:flutter_application_final/product/widget/exit_dialog.dart';
import 'package:flutter_application_final/views/NewGameView/new_game.dart';
import 'package:flutter_application_final/views/SettingsView/settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/main_background.png'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0, bottom: 64.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  MultiLanguages.of(context)!.translate('app_name'),
                  style: TextStyle(
                      fontSize: CustomTextStyle().homeHeaderTextSize,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            offset: const Offset(3.0, 3.0),
                            blurRadius: 3.0,
                            color: Theme.of(context).primaryColor),
                        Shadow(
                            offset: const Offset(3.0, 3.0),
                            blurRadius: 3.0,
                            color: Theme.of(context).primaryColor)
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
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return const GameBottomSheet();
                              });
                        },
                        icon: const Icon(Icons.play_arrow_outlined),
                        label: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('app_newgame'),
                              style: TextStyle(
                                  fontSize: CustomTextStyle().fontSizeM),
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
                        icon: const Icon(Icons.settings),
                        label: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('app_settings'),
                              style: TextStyle(
                                  fontSize: CustomTextStyle().fontSizeM),
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
                        icon: const Icon(Icons.exit_to_app_rounded),
                        label: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              MultiLanguages.of(context)!.translate('app_exit'),
                              style: TextStyle(
                                  fontSize: CustomTextStyle().fontSizeM),
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
    return SafeArea(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 800),
        child: Container(
          color: Theme.of(context).bottomAppBarColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0, bottom: 12.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                      MultiLanguages.of(context)!
                          .translate('start_select_horse'),
                      style: const TextStyle(fontSize: 36.0)),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(MultiLanguages.of(context)!.translate('select_horse'),
                      style: const TextStyle(fontSize: 24.0)),
                  const Expanded(child: Center(child: NewGame())),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(99.0),
                                      side: const BorderSide(
                                          width: 2,
                                          color: Colors.transparent)))),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              MultiLanguages.of(context)!
                                  .translate('return_home'),
                              style: TextStyle(
                                  fontSize: CustomTextStyle().fontSizeM),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
