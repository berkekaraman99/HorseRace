import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/constants/app/app_constants.dart';
import 'package:flutter_application_final/core/constants/image/image_constants.dart';
import 'package:flutter_application_final/product/model/horse_model.dart';

// ignore: must_be_immutable
class WinnerList extends StatelessWidget {
  WinnerList({Key? key, required this.winnerList, this.index})
      : super(key: key);

  final List<Horse> winnerList;
  int? index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${index! + 1}.',
                style: const TextStyle(fontSize: AppConstants.fontSizeL),
              ),
              ImageConstants.horseIcon,
              const SizedBox(width: 16.0),
              Text(
                '${winnerList[index!].name}',
                style: TextStyle(
                    color: winnerList[index!].color,
                    fontSize: AppConstants.fontSizeL),
              )
            ],
          ),
          const SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
