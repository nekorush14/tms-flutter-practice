import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> emailProvider = StateProvider<String>((ref) => "");

final StateProvider<String> passwordProvider =
    StateProvider<String>((ref) => "");

final StateProvider<String> displayNameProvider =
    StateProvider<String>((ref) => "");

final StateProvider<bool> signUpProvider = StateProvider<bool>((ref) => false);
