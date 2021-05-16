import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/views/welcome_page.dart';
import 'package:tms/providers/util_providers.dart';

void main() {
  runApp(
    UncontrolledProviderScope(container: providerContainer, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
    );
  }
}
