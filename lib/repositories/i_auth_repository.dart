import 'package:firebase_auth/firebase_auth.dart';

abstract class IBaseAuthRepository {
  Stream<User?> get authStateChanges;

  Future<void> signInAnonymously();

  User? getCurrentUser();

  Future<void> signOut();

  Future<void> signIn(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);
}
