import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_final/core/lang/locale_keys.g.dart';
import 'package:flutter_application_final/core/global/sfx.dart';
import 'package:flutter_application_final/core/global/animated_duration_const.dart';
import 'package:flutter_application_final/core/global/text_const.dart';
import 'package:flutter_application_final/core/global/winner_list.dart';
import 'package:flutter_application_final/product/model/horse_model.dart';
import 'package:flutter_application_final/product/widget/horse_winner_list.dart';
import 'package:flutter_application_final/views/GamePageView/game_page.dart';
import 'package:flutter_application_final/views/HomeView/home.dart';

class RaceEnd extends StatefulWidget {
  const RaceEnd({super.key, this.selectedHorse});
  final Horse? selectedHorse;

  @override
  State<RaceEnd> createState() => _RaceEndState();
}

class _RaceEndState extends State<RaceEnd> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    showWinnerDialog();
  }

  Future<void> showWinnerDialog() async {
    await Future.delayed(const Duration(seconds: 1));

    // ! atın kazanıp kazanmadığı kontrol edilir
    if (HorseWinnerList.winnerList.first == widget.selectedHorse) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: Text(
                    LocaleKeys.game_win.tr(),
                    style: const TextStyle(fontSize: 24.0, letterSpacing: 1),
                  ),
                )),
          ).animate().fade(duration: 1.seconds);
        },
      );
      _confettiController.play();
      AudioPlay().playGameWinSound();
      Timer(const Duration(seconds: 4), (() {
        Navigator.pop(context);
      }));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _confettiController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/main_background.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.gamestate_winnerlist.tr(),
                    style: TextStyle(
                        fontSize: CustomTextStyle().fontSizeHeader,
                        shadows: [
                          Shadow(
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Theme.of(context).secondaryHeaderColor),
                          Shadow(
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 3.0,
                              color: Theme.of(context).secondaryHeaderColor)
                        ])).animate().fade(duration: 500.ms),
                const SizedBox(height: 16.0),
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxHeight: 600, maxWidth: 200),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: HorseWinnerList.winnerList.length,
                              itemBuilder: (context, index) {
                                return WinnerList(
                                    winnerList: HorseWinnerList.winnerList,
                                    index: index);
                              },
                            ),
                          ))
                      .animate()
                      .fade(duration: AnimatedDuration.animateDuration),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99.0),
                            side: const BorderSide(
                                width: 2, color: Colors.transparent)))),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        LocaleKeys.return_home.tr(),
                        style: TextStyle(fontSize: CustomTextStyle().fontSizeM),
                      ),
                    )),
                const SizedBox(height: 16),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99.0),
                            side: const BorderSide(
                                width: 2, color: Colors.transparent)))),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          isDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return const GameBottomSheet();
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        'Play Again',
                        style: TextStyle(fontSize: CustomTextStyle().fontSizeM),
                      ),
                    )),
                const SizedBox(height: 16),
                Text(
                  '${LocaleKeys.selected_horse.tr()} ${widget.selectedHorse?.name}',
                  style: TextStyle(
                      fontSize: CustomTextStyle().fontSizeM,
                      shadows: [
                        Shadow(
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 3.0,
                            color: Theme.of(context).secondaryHeaderColor),
                        Shadow(
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 3.0,
                            color: Theme.of(context).secondaryHeaderColor)
                      ]),
                ),
                ConfettiWidgy(
                    confettiController: _confettiController,
                    alignment: Alignment.topRight,
                    blastDirection: 5 * pi / 4),
                ConfettiWidgy(
                    confettiController: _confettiController,
                    alignment: Alignment.topLeft,
                    blastDirection: -pi / 4)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
