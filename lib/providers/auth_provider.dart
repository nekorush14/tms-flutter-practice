import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/auth_controller.dart';
import 'package:tms/controllers/authentication_contorller.dart';
import 'package:tms/repositories/impl/auth_repository.dart';
import 'package:tms/utils/exceptions/businessException.dart';

// final Provider<FirebaseAuth> firebaseAuthProvider =
//     Provider<FirebaseAuth>((ref) {
//   return FirebaseAuth.instance;
// });

// final Provider<AuthenticationController> authServicesProvider =
//     Provider<AuthenticationController>((ref) {
//   return AuthenticationController(ref.read(firebaseAuthProvider));
// });

// final StreamProvider<User?> authStateProvider = StreamProvider<User?>((ref) {
//   return ref.watch(authServicesProvider).authStateChange;
// });

/// Provide auth repository functions
final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

/// Provide auth controller functions
final StateNotifierProvider<AuthController> authControllerProvider =
    StateNotifierProvider<AuthController>((ref) => AuthController(ref.read));
