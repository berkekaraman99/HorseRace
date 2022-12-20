part of 'package:flutter_application_final/views/GamePageView/game_page.dart';

// ! confetti widgeti
class ConfettiWidgy extends StatelessWidget {
  const ConfettiWidgy(
      {Key? key,
      required ConfettiController confettiController,
      required Alignment alignment,
      required blastDirection})
      : _confettiController = confettiController,
        _alignment = alignment,
        _blastDirection = blastDirection,
        super(key: key);

  final ConfettiController _confettiController;
  final Alignment _alignment;
  final double _blastDirection;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _alignment,
      child: ConfettiWidget(
        confettiController: _confettiController,
        blastDirection: _blastDirection,
        emissionFrequency: 0.01,
        numberOfParticles: 20,
        maxBlastForce: 120,
        minBlastForce: 80,
        gravity: 0.1,
      ),
    );
  }
}
