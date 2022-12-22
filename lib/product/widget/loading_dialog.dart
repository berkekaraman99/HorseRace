import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final/core/constants/app/app_constants.dart';
import 'package:flutter_application_final/core/extension/context_extension.dart';
import 'package:flutter_application_final/core/lang/locale_keys.g.dart';
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
                baseColor: context.theme.primaryColor,
                highlightColor: context.theme.highlightColor,
                child: Text(
                  LocaleKeys.game_loading.tr(),
                  style: const TextStyle(
                      letterSpacing: 1, fontSize: AppConstants.fontSizeM),
                ),
              ),
            )));
  }
}
