import 'package:flutter/material.dart';

class BusinessExceptionHandler extends ChangeNotifier{
  String? title;
  String? content;

  String? get Title => this.title;
  String? get Content => this.content;

  void updateTitleAndContent(String title, String content) {
    this.title = title;
    this.content = content;
    notifyListeners();
  }
}
