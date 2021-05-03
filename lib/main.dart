import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/views/home_page_view.dart';
import 'package:tms/app/views/sign_in_page_view.dart';
import 'package:tms/app/views/welcome_page_view.dart';
import 'package:tms/app/views/widgets/authentication_widget.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/welcome_page_view_model_provider.dart';
import 'package:tms/routers/applicatioin_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firebaseAuth = context.read(firebaseAuthProvider);

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: AuthenticationWidget(
        nonSignedInBuilder: (_) => Consumer(
          builder: (context, watch, _) {
            final isCompleteReaching =
                watch(welcomePageViewModelProvider).state;
            return isCompleteReaching ? SignInPage() : WelcomePage();
          },
        ),
        signedInBuilder: (_) => HomePage(),
      ),
      onGenerateRoute: (settings) =>
          ApplicationRouter.onGenerateRoute(settings, firebaseAuth),
    );
  }
}
