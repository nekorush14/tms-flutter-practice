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
      print("${e.message}");
      return e.message;
    }
  }

  /// User sign up with [displayName], [email] and [password]
  Future<String?> signUp(
      {required String displayName,
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
        print("User not found");
      }
      return "SignUp Successful";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// User sign out from current session
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> fetchCurrentUserWithReload() async {
    await _firebaseAuth.currentUser!.reload();
    return _firebaseAuth.currentUser;
  }

  User? fetchCurrentUser() => _firebaseAuth.currentUser;
}
