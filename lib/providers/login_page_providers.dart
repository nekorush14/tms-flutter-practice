import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final emailProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final passwordProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final displayNameProvider = StateProvider.autoDispose<String>((ref) => "");
