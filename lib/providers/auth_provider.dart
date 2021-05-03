import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/auth_controller.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final Provider<AuthenticationController> authServicesProvider =
    Provider<AuthenticationController>((ref) {
  return AuthenticationController(ref.read(firebaseAuthProvider));
});
