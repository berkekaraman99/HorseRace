//* Çıkış diyalogu
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_final/core/constants/app/app_constants.dart';
import 'package:flutter_application_final/core/extension/string_extension.dart';

import '../../core/lang/locale_keys.g.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.dialog_exit_app.locale,
          style: const TextStyle(fontSize: AppConstants.fontSizeL)),
      content: Text(LocaleKeys.dialog_exit_app_message.locale,
          style: const TextStyle(fontSize: AppConstants.fontSizeS)),
      actions: [
        ElevatedButton(
          onPressed: () async {
            SystemNavigator.pop();
            await Future.delayed(const Duration(milliseconds: 500));
            exit(0);
          },
          child: Text(
            LocaleKeys.exit_yes.locale,
            style: const TextStyle(fontSize: AppConstants.fontSizeS),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            LocaleKeys.exit_no.locale,
            style: const TextStyle(fontSize: AppConstants.fontSizeS),
          ),
        ),
      ],
    );
  }
}
