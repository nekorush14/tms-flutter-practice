import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/providers/auth_provider.dart';

class CommonViewModel {
  void signOut(BuildContext context) {
    context.read(authControllerProvider).signOut();
  }
}
