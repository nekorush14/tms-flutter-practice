import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/res/strings/sheared.dart';

Widget ExceptionDialog(
    BuildContext context, ScopedReader watch, Function? func) {
  final _exception = watch(businessExceptionProvider);

  return AlertDialog(
    title: Text(_exception.title ?? ""),
    content: Text(_exception.content ?? ""),
    actions: [
      SimpleDialogOption(
        child: Text(okBtnLbl),
        onPressed: () {
          _exception.updateTitleAndContent("", "");
          func ?? Navigator.of(context).pop();
        }
      )
    ],
  );
}
