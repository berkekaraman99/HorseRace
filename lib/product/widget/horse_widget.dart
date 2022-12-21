part of 'package:flutter_application_final/views/GamePageView/game_page.dart';

class HorseWidgy extends StatefulWidget {
  const HorseWidgy({
    Key? key,
    required this.finishLine,
    required this.aniConWidth,
    required this.horse,
    required this.color,
    required this.top,
  }) : super(key: key);

  final double finishLine;
  final double aniConWidth;
  final Horse horse;
  final Color color;
  final double top;

  @override
  State<HorseWidgy> createState() => _HorseWidgyState();
}

class _HorseWidgyState extends State<HorseWidgy> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: widget.top,
      child: widget.horse.isFinished!
          ? SizedBox(
              width: widget.finishLine,
              height: 40.0,
              child: Center(
                  child: Text(
                LocaleKeys.gamestate_horse_race_finished.tr(),
                style: TextStyle(fontSize: CustomTextStyle().fontSizeM),
              )),
            )
          : AnimatedContainer(
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))),
              height: 60,
              width: widget.aniConWidth,
              margin: const EdgeInsets.all(8.0),
              duration: AnimatedDuration.animateDuration,
            ),
    );
  }
}
