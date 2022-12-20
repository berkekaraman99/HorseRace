import 'dart:math';

import 'package:flutter/material.dart';

class Horse {
  String? name;
  double? location;
  double? move;
  bool? isFinished;
  int? index;
  Color? color;
  double? speed = 1.0;
  Horse(
      {this.name,
      this.location,
      this.move,
      this.isFinished,
      this.index,
      this.color});

  Future<void> calcuteMove() async {
    move = Random.secure().nextDouble() * 3 * speed!;
  }

  Future<void> updateLocation() async {
    location = (location ?? 0) + (move ?? 0);
  }

  Future<void> updateIsFinished() async {
    isFinished = true;
  }

  void changeSpeed(double speed) {
    this.speed = speed;
  }

  double getSpeed() => speed!;

  static List<Horse> horses = [
    Horse(
        name: '1',
        location: 0,
        move: 0,
        isFinished: false,
        index: 0,
        color: Colors.red),
    Horse(
        name: '2',
        location: 0,
        move: 0,
        isFinished: false,
        index: 1,
        color: Colors.orange),
    Horse(
        name: '3',
        location: 0,
        move: 0,
        isFinished: false,
        index: 2,
        color: Colors.green),
    Horse(
        name: '4',
        location: 0,
        move: 0,
        isFinished: false,
        index: 3,
        color: Colors.blue),
    Horse(
        name: '5',
        location: 0,
        move: 0,
        isFinished: false,
        index: 4,
        color: Colors.purple),
  ];
}
