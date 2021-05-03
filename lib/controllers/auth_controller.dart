import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/auth_provider.dart';

class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void appStarted() async {
    final user = _read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      await _read(authRepositoryProvider).signInAnonymously();
    }
  }

  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }

  void signIn(String email, String password) async {
    await _read(authRepositoryProvider).signIn(email, password);
  }

  void signUp(String email, String password) async {
    await _read(authRepositoryProvider)
        .signUpWithEmailAndPassword(email, password);
  }

  Future<User?> fetchCurrentUser() async {
    return await _read(authRepositoryProvider).getCurrentUser();
  }
}
