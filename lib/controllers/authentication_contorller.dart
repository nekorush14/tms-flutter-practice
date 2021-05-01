import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController {
  final FirebaseAuth _firebaseAuth;

  AuthenticationController(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  /// User sign in to the system with [email] and [password]
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Login Successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// User sign up with [name], [email] and [password]
  Future<bool> signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null) {
        user.updateProfile(displayName: name);
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  /// User sign out from current session
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }
}
