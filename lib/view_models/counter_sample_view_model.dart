import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppViewModel {
  final _counterProvider = StateProvider((ref) => 0);

  void countUpSate(BuildContext context) {
    context.read(_counterProvider).state++;
  }

  StateProvider<int> fetchProvider() {
    return this._counterProvider;
  }

  void resetCounter(BuildContext context) {
    context.read(_counterProvider).state = 0;
  }
}
