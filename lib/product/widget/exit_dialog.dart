//* Çıkış diyalogu
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_final/core/global/text_const.dart';

import '../../core/lang/locale_keys.g.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.dialog_exit_app.tr(),
          style: TextStyle(fontSize: CustomTextStyle().fontSizeL)),
      content: Text(LocaleKeys.dialog_exit_app_message.tr(),
          style: TextStyle(fontSize: CustomTextStyle().fontSizeS)),
      actions: [
        ElevatedButton(
          onPressed: () async {
            SystemNavigator.pop();
            await Future.delayed(const Duration(milliseconds: 500));
            exit(0);
          },
          child: Text(
            LocaleKeys.exit_yes.tr(),
            style: TextStyle(fontSize: CustomTextStyle().fontSizeS),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            LocaleKeys.exit_no.tr(),
            style: TextStyle(fontSize: CustomTextStyle().fontSizeS),
          ),
        ),
      ],
    );
  }
}
