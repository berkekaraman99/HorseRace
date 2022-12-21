import 'package:flutter/material.dart';

class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  static Image horseRunning =
      Image.asset('assets/images/running_horse.gif', height: 60.0);
  static Image horseIcon =
      Image.asset('assets/images/horse_icon.png', height: 48.0);
  static Image flag = Image.asset('assets/images/race_flag.png', height: 48.0);
}
