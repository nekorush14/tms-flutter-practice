import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/firebase_provider.dart';
import 'package:tms/repositories/i_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthRepository implements IBaseAuthRepository {
  /// [_reader] allow the auth repository to read other providers in the app.
  final Reader _read;

  /// Constructor
  const AuthRepository(this._read);

  /// Return the current user state whenever the current user sign in or
  /// signs out
  @override
  Stream<User?> get authStateChanges =>
      _read(firebaseAuthProvider).authStateChanges();

  /// Get users who are currently signed in to the app
  @override
  User? getCurrentUser() {
    try {
      return _read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      _read(fireBaseExceptionProvider).state = e;
    }
  }

  /// Sign in to the app as anonymous
  ///
  /// Wait to create anonymous user in firebase
  @override
  Future<void> signInAnonymously() async {
    try {
      await _read(firebaseAuthProvider).signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _read(fireBaseExceptionProvider).state = e;
    }
  }

  /// Sign out from the app
  ///
  /// Currentry re-sign in as anonymously to always be authenticated
  /// while using application
  @override
  Future<void> signOut() async {
    try {
      await _read(firebaseAuthProvider).signOut();
      await signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _read(fireBaseExceptionProvider).state = e;
    }
  }

  /// Sign in with inputed [email] address and [password].
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _read(fireBaseExceptionProvider).state = e;
    }
  }

  /// Sign up with inputed [email] address and [password].
  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _read(fireBaseExceptionProvider).state = e;
    }
  }
}
