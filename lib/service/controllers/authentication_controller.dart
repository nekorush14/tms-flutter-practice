import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/res/strings/messages.dart';

class AuthenticationController {
  final FirebaseAuth _firebaseAuth;
  final ProviderContainer _container = new ProviderContainer();

  AuthenticationController(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  /// User sign in to the system with [email] and [password]
  Future<bool> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      createFbAuthExceptionTelemetry(e, context);
      return false;
    }
  }

  /// User sign up with [displayName], [email] and [password]
  Future<bool> signUp(
      {required BuildContext context,
      required String displayName,
      required String email,
      required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateProfile(displayName: displayName);
      } else {
        _container
            .read(businessExceptionProvider)
            .create(userNotFoundExceptionTitle, userNotFoundMsg);

        _container.read(loggerProvider).shout(userNotFoundExceptionTitle);
        _container.read(loggerProvider).shout(userNotFoundMsg);
        _container.read(loggerProvider).shout(userNotFoundLogMsg);
        return false;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      createFbAuthExceptionTelemetry(e, context);
      return false;
    }
  }

  /// User sign out from current session
  Future<void> signOut({required BuildContext context}) async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      createFbAuthExceptionTelemetry(e, context);
    }
  }

  Future<User?> fetchCurrentUserWithReload() async {
    await _firebaseAuth.currentUser!.reload();
    return _firebaseAuth.currentUser;
  }

  User? fetchCurrentUser() => _firebaseAuth.currentUser;

  void createFbAuthExceptionTelemetry(
      FirebaseAuthException e, BuildContext context) {
    var provider = context.read(businessExceptionProvider);
    provider.create(firebaseAuthExceptionTitle, e.message!);

    context.read(loggerProvider).shout(fbAuthExpOccurredMsg);
    context.read(loggerProvider).shout(e.code);
    context.read(loggerProvider).shout(e.message);
    context.read(loggerProvider).shout(e.stackTrace);
  }
}
