import 'package:flutter/material.dart';
import 'package:flutter_application_final/product/extension/multi_languages.dart';
import 'package:flutter_application_final/product/global/text_const.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
            height: 50,
            width: 300,
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                child: Text(
                  MultiLanguages.of(context)!.translate('game_loading'),
                  style: TextStyle(
                      letterSpacing: 1, fontSize: CustomTextStyle().fontSizeM),
                ),
              ),
            )));
  }
}
