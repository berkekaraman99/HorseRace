import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/constants/image/image_constants.dart';
import 'package:flutter_application_final/core/extension/context_extension.dart';
import 'package:flutter_application_final/product/model/horse_model.dart';
import 'package:flutter_application_final/product/widget/loading_dialog.dart';
import 'package:flutter_application_final/views/GamePageView/game_page.dart';

//* AT SEÇİMİNİN YAPILDIGI SAYFA
class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  Horse? selectedHorse;
  late final _pageController = PageController(viewportFraction: 1);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                _pageController.previousPage(
                    duration: context.durationLow, curve: Curves.easeInOut);
              },
              child: const Icon(Icons.arrow_back_ios_new, size: 32.0)),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 150, maxWidth: 200),
            child: PageView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: Horse.horses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(
                                        width: 4,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageConstants.horseIcon,
                            const SizedBox(width: 18.0),
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  color: Horse.horses[index].color,
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )),
                  );
                }),
          ),
          InkWell(
              onTap: () {
                _pageController.nextPage(
                    duration: context.durationLow, curve: Curves.easeInOut);
              },
              child: const Icon(Icons.arrow_forward_ios, size: 32.0))
        ],
      ),
    );
  }
}
