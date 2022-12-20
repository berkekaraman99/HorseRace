import 'dart:async';
import 'dart:math';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_application_final/product/extension/sfx.dart';
import 'package:flutter_application_final/product/global/animated_duration_const.dart';
import 'package:flutter_application_final/product/global/horse_images.dart';
import 'package:flutter_application_final/product/global/text_const.dart';
import 'package:flutter_application_final/product/global/winner_list.dart';
import 'package:flutter_application_final/product/model/horse_model.dart';
import 'package:flutter_application_final/product/widget/horse_winner_list.dart';
import 'package:flutter_application_final/views/HomeView/home.dart';
import 'package:flutter_application_final/product/extension/multi_languages.dart';
import 'package:flutter_application_final/views/RaceEndView/race_end.dart';

part 'package:flutter_application_final/product/widget/horse_widget.dart';
part 'package:flutter_application_final/product/widget/horse_animated_widget.dart';
part 'package:flutter_application_final/product/widget/confetti_widget.dart';

class GameState extends StatefulWidget {
  const GameState({super.key, this.selectedHorse});
  final Horse? selectedHorse;

  @override
  State<GameState> createState() => _GameStateState();
}

class _GameStateState extends State<GameState> {
  List<double> aniConWidth =
      List.generate(5, (index) => Horse.horses[index].location ?? 0);
  // List<Horse> winnerList = List.empty(growable: true);
  bool toggleWidget = true;
  final double finishLine = 900.0;
  final List<double> _horsePosition = [50, 150, 250, 350, 450];
  int speed = 1;
  final List<double> _speeds = [1.0, 2.0, 5.0, 10.0];
  double? currentSpeed;
  int? i;

  // ! initState
  @override
  void initState() {
    super.initState();
    currentSpeed = 1;
    i = 0;
    _waitFunction();
  }

  // ? kontrol fonksiyonu
  Future<void> _func() async {
    while (true) {
      if (Horse.horses[0].location! >= finishLine &&
          Horse.horses[1].location! >= finishLine &&
          Horse.horses[2].location! >= finishLine &&
          Horse.horses[3].location! >= finishLine &&
          Horse.horses[4].location! >= finishLine) {
        break;
      } else {
        for (var horse in Horse.horses) {
          if ((horse.location!) < finishLine) {
            horse.calcuteMove();
            horse.updateLocation();
            setState(() {
              aniConWidth[horse.index!] = horse.location!;
            });
            if (horse.location! >= finishLine) {
              HorseWinnerList.winnerList.add(horse);
              horse.isFinished = true;
            }
          }
          await Future.delayed(const Duration(milliseconds: 50));
        }
      }
    }
    setState(() {
      toggleWidget = false;
    });

    navigateEndPage();
  }

  void navigateEndPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                RaceEnd(selectedHorse: widget.selectedHorse)));
  }

  // ! değerler varsayılana alınır
  void _defaultValues() {
    for (var horse in Horse.horses) {
      horse.location = 0;
      horse.isFinished = false;
      horse.speed = 1;
    }
  }

  // ! bekleme fonksiyonu
  Future<void> _waitFunction() async {
    await Future.delayed(const Duration(seconds: 5)).then((_) async {
      AudioPlay().playGameStartSound();
      _func();
    });
  }

  // ! sayfadan çıkıldığında fonksiyonlar çalışır
  @override
  void dispose() {
    _defaultValues();
    HorseWinnerList.winnerList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/main_background.png'),
                fit: BoxFit.cover)),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                            toggleWidget
                                ? MultiLanguages.of(context)!
                                    .translate('gamestate_race_start')
                                : MultiLanguages.of(context)!
                                    .translate('gamestate_race_end'),
                            style: TextStyle(
                                fontSize: CustomTextStyle().fontSizeHeader,
                                shadows: [
                                  Shadow(
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 3.0,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor),
                                  Shadow(
                                      offset: const Offset(0.0, 0.0),
                                      blurRadius: 3.0,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor)
                                ])),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).cardColor.withOpacity(0.9),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0))),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxWidth: 1000,
                                maxHeight: 600,
                                minWidth: 500,
                                minHeight: 400),
                            child: Stack(
                              children: [
                                // ! 1. At
                                HorseWidgy(
                                  finishLine: finishLine,
                                  aniConWidth: aniConWidth[0],
                                  horse: Horse.horses[0],
                                  color: Horse.horses[0].color!,
                                  top: _horsePosition[0],
                                ),
                                Horse.horses[0].isFinished!
                                    ? Container()
                                    : _HorseAnimated(
                                        aniConWidth: aniConWidth[0],
                                        top: _horsePosition[0],
                                      ),
                                // ! 2. At
                                HorseWidgy(
                                  finishLine: finishLine,
                                  aniConWidth: aniConWidth[1],
                                  horse: Horse.horses[1],
                                  color: Horse.horses[1].color!,
                                  top: _horsePosition[1],
                                ),
                                Horse.horses[1].isFinished!
                                    ? Container()
                                    : _HorseAnimated(
                                        aniConWidth: aniConWidth[1],
                                        top: _horsePosition[1],
                                      ),
                                // ! 3. At
                                HorseWidgy(
                                  finishLine: finishLine,
                                  aniConWidth: aniConWidth[2],
                                  horse: Horse.horses[2],
                                  color: Horse.horses[2].color!,
                                  top: _horsePosition[2],
                                ),
                                Horse.horses[2].isFinished!
                                    ? Container()
                                    : _HorseAnimated(
                                        aniConWidth: aniConWidth[2],
                                        top: _horsePosition[2],
                                      ),
                                // ! 4. At
                                HorseWidgy(
                                  finishLine: finishLine,
                                  aniConWidth: aniConWidth[3],
                                  horse: Horse.horses[3],
                                  color: Horse.horses[3].color!,
                                  top: _horsePosition[3],
                                ),
                                Horse.horses[3].isFinished!
                                    ? Container()
                                    : _HorseAnimated(
                                        aniConWidth: aniConWidth[3],
                                        top: _horsePosition[3],
                                      ),
                                // ! 5. At
                                HorseWidgy(
                                  finishLine: finishLine,
                                  aniConWidth: aniConWidth[4],
                                  horse: Horse.horses[4],
                                  color: Horse.horses[4].color!,
                                  top: _horsePosition[4],
                                ),
                                Horse.horses[4].isFinished!
                                    ? Container()
                                    : _HorseAnimated(
                                        aniConWidth: aniConWidth[4],
                                        top: _horsePosition[4],
                                      ),
                                // ! Finish Line
                                const Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 900,
                                    child: VerticalDivider(
                                      width: 0,
                                      thickness: 2,
                                      indent: 0,
                                      endIndent: 0,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40.0,
                            child: ElevatedButton(
                                onPressed: () {
                                  i = i! - 1;
                                  if (i! < 0) {
                                    i = 3;
                                  }
                                  setState(() {
                                    for (var horse in Horse.horses) {
                                      horse.changeSpeed(_speeds[i!]);
                                    }
                                    currentSpeed = _speeds[i!];
                                  });
                                },
                                child: const Icon(Icons.arrow_left_outlined)),
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                  "${MultiLanguages.of(context)!.translate('game_speed')}: $currentSpeed",
                                  style: TextStyle(
                                      fontSize: CustomTextStyle().fontSizeM,
                                      shadows: [
                                        Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 3.0,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor),
                                        Shadow(
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 3.0,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor)
                                      ])),
                            ),
                          ),
                          SizedBox(
                            height: 40.0,
                            child: ElevatedButton(
                                onPressed: () {
                                  i = i! + 1;
                                  if (i == _speeds.length) {
                                    i = 0;
                                  }
                                  setState(() {
                                    for (var horse in Horse.horses) {
                                      horse.changeSpeed(_speeds[i!]);
                                    }
                                    currentSpeed = _speeds[i!];
                                  });
                                },
                                child: const Icon(Icons.arrow_right_outlined)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        '${MultiLanguages.of(context)!.translate('selected_horse')} ${widget.selectedHorse?.name}',
                        style: TextStyle(
                            fontSize: CustomTextStyle().fontSizeM,
                            shadows: [
                              Shadow(
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 3.0,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                              Shadow(
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 3.0,
                                  color: Theme.of(context).secondaryHeaderColor)
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
