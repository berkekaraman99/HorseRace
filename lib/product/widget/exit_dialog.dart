//* Çıkış diyalogu
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_final/product/extension/multi_languages.dart';
import 'package:flutter_application_final/product/global/text_const.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(MultiLanguages.of(context)!.translate('dialog_exit_app'),
          style: TextStyle(fontSize: CustomTextStyle().fontSizeL)),
      content: Text(
          MultiLanguages.of(context)!.translate('dialog_exit_app_message'),
          style: TextStyle(fontSize: CustomTextStyle().fontSizeS)),
      actions: [
        ElevatedButton(
          onPressed: () async {
            SystemNavigator.pop();
            await Future.delayed(const Duration(milliseconds: 500));
            exit(0);
          },
          child: Text(
            MultiLanguages.of(context)!.translate('exit_yes'),
            style: TextStyle(fontSize: CustomTextStyle().fontSizeS),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            MultiLanguages.of(context)!.translate(
              'exit_no',
            ),
            style: TextStyle(fontSize: CustomTextStyle().fontSizeS),
          ),
        ),
      ],
    );
  }
}
