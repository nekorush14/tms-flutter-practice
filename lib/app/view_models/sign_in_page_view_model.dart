import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPageViewModel with ChangeNotifier {
  final FirebaseAuth auth;
  bool isLoading = false;
  dynamic error;

  SignInPageViewModel({required this.auth});

  Future<void> _signIn(Future<UserCredential> Function() signInMethod) async {
    try {
      isLoading = true;
      notifyListeners();
      await signInMethod();
      error = null;
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signInAnonymously() async {
    await _signIn(auth.signInAnonymously);
  }
}
