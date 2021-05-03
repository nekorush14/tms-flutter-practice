import 'package:flutter/material.dart';
import 'package:tms/res/labels/dialog_label.dart';

class ShowDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final dynamic exception;
  final BuildContext context;

  const ShowDialogWidget(
      {Key? key,
      this.title = "Default Title",
      this.message = "Default message",
      this.exception,
      required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(this.message),
            Text(this.exception != null
                ? this.exception.message.toString()
                : ""),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(okLbl),
          onPressed: () => Navigator.of(this.context).pop(),
        )
      ],
    );
  }
}
