import 'package:flutter/material.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/res/strings/sheared.dart';

Widget ExceptionDialog(BuildContext context, Function? func) {
  return AlertDialog(
    title: Text(providerContainer.read(businessExceptionProvider).title),
    content: Text(providerContainer.read(businessExceptionProvider).content),
    actions: [
      SimpleDialogOption(
          child: Text(okBtnLbl),
          onPressed: () {
            providerContainer.read(businessExceptionProvider).reset();
            func ?? Navigator.of(context).pop();
          })
    ],
  );
}
