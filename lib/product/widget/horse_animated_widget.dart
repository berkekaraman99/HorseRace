part of 'package:flutter_application_final/views/GamePageView/game_page.dart';

// Hareketli at resmi
class _HorseAnimated extends StatelessWidget {
  const _HorseAnimated({Key? key, required this.aniConWidth, required this.top})
      : super(key: key);

  final double aniConWidth;
  final double top;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      left: aniConWidth,
      top: top,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ImageConstants.horseRunning,
      ),
    );
  }
}
