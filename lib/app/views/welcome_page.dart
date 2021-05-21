import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/views/home_page.dart';
import 'package:tms/app/views/sign_in_page.dart';
import 'package:tms/providers/auth_providers.dart';
import 'package:tms/providers/util_providers.dart';

class StartPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final ProviderContainer _container = new ProviderContainer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          _container
              .read(loggerProvider)
              .shout("Firebase initialization failed");
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          _container
              .read(loggerProvider)
              .info("Firebase initialization has been completed");
          return AuthChecker();
        }
        //loading
        _container
            .read(loggerProvider)
            .info("Initializing Firebase");
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class AuthChecker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    final _logger = watch(loggerProvider);

    return _authState.when(
      data: (value) {
        if (value != null) {
          _logger.finest("User has been authenticated");
          return HomePage();
        }
        _logger.finest("User not sign in");
        return LoginPage();
      },
      loading: () {
        _logger.finer("Loading page");
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (_, __) {
        _logger.severe("Authentication: Something went wrong");
        return Scaffold(
          body: Center(
            child: Text("OOPS"),
          ),
        );
      },
    );
  }
}
