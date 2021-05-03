import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tms/app/views/sign_in_email_password_view.dart';
import 'package:tms/res/messages/exception.dart';
import 'package:tms/utils/constants.dart';
import 'package:tms/utils/exceptionis/business_exception.dart';

class ApplicationRouter {
  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, FirebaseAuth firebaseAuth) {
    final args = settings.arguments;
    switch (settings.name) {
      // Requets sign in with email and password page
      case signInWithEmailAndPasswordPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInWithEmailAndPassWordPageView(),
          settings: settings,
          fullscreenDialog: true,
        );
      // Requets entory page
      // case entoryPage:
      //   final mapArgs = args as Map<String, dynamic>;
      //   final job = mapArgs['job'] as Job;
      //   final entry = mapArgs['entry'] as Entry?;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EntryPage(job: job, entry: entry),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      default:
        throw new BusinessException(message: noRoteFoundExceptionMsg);
    }
  }
}
