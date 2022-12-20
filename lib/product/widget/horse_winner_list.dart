import 'package:flutter/material.dart';
import 'package:flutter_application_final/product/global/images.dart';
import 'package:flutter_application_final/product/global/text_const.dart';
import 'package:flutter_application_final/product/model/horse_model.dart';

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
                style: TextStyle(fontSize: CustomTextStyle().fontSizeL),
              ),
              AppImages().horseIcon,
              const SizedBox(width: 16.0),
              Text(
                '${winnerList[index!].name}',
                style: TextStyle(
                    color: winnerList[index!].color,
                    fontSize: CustomTextStyle().fontSizeL),
              )
            ],
          ),
          const SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
