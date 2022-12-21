import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/lang/locale_keys.g.dart';
import 'package:flutter_application_final/core/global/text_const.dart';
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
                  LocaleKeys.game_loading.tr(),
                  style: TextStyle(
                      letterSpacing: 1, fontSize: CustomTextStyle().fontSizeM),
                ),
              ),
            )));
  }
}
