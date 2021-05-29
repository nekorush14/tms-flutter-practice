import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/res/strings/labels.dart';

Widget ExceptionDialog(BuildContext context, Function? func) {

  return AlertDialog(
    title: Text(context.read(businessExceptionProvider).title),
    content: Text(context.read(businessExceptionProvider).content),
    actions: [
      SimpleDialogOption(
          child: Text(okBtnLbl),
          onPressed: () {
            context.read(businessExceptionProvider).reset();
            func ?? Navigator.of(context).pop();
          })
    ],
  );
}
