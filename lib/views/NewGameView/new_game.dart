import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/product/global/images.dart';
import 'package:flutter_application_final/product/model/horse_model.dart';
import 'package:flutter_application_final/product/widget/loading_dialog.dart';
import 'package:flutter_application_final/views/GamePageView/game_page.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  Horse? selectedHorse;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: Horse.horses.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                                width: 2,
                                color: Horse.horses[index].color ??
                                    Colors.white)))),
                    onPressed: () {
                      selectedHorse = Horse.horses[index];
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: ((context) {
                            return const LoadingDialog();
                          }));
                      Timer(
                        const Duration(seconds: 2),
                        () {
                          Navigator.pop(context);
                          Timer(const Duration(milliseconds: 750), () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GameState(
                                          selectedHorse: selectedHorse,
                                        )));
                          });
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppImages().horseIcon,
                          const SizedBox(width: 18.0),
                          Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Horse.horses[index].color,
                                fontSize: 48.0),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            );
          }),
    );
  }
}
