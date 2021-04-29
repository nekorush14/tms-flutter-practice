import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/authentication_contorller.dart';

final Provider<FirebaseAuth> firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final Provider<AuthenticationController> authServicesProvider =
    Provider<AuthenticationController>((ref) {
  return AuthenticationController(ref.read(firebaseAuthProvider));
});

final StreamProvider<User?> authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
