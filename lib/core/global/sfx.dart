// ignore_for_file: non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';

class AudioPlay {
  final AssetSource game_start = AssetSource('audio/game_start.wav');
  final AssetSource game_win = AssetSource('audio/game_win_race.wav');

  Future<void> playGameStartSound() async {
    await AudioPlayer().play(game_start);
    await AudioPlayer().stop();
  }

  Future<void> playGameWinSound() async {
    await AudioPlayer().play(game_win);
    await AudioPlayer().stop();
  }
}
