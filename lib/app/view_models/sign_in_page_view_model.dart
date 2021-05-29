import 'package:flutter/material.dart';
import 'package:tms/service/controllers/authentication_controller.dart';

class LoginPageViewModel extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  String email = "";
  String password = "";

  /// Update Email provider state with user inputted [email] address at called [context].
  void updateEmail(BuildContext context, String email) {
    // context.read(emailProvider).state = email;
    this.email = email;
  }

  /// Update Password provider state with user inputted [password] at called [context].
  void updatePassword(BuildContext context, String password) {
    // context.read(passwordProvider).state = password;
    this.password = password;
  }

  /// Sign in to the system with valid formatted [email] address and [password].
  Future<bool> signIn(
      BuildContext context, AuthenticationController _auth) async {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      return await _auth.signIn(
          context: context, email: email, password: password);
    }
    return false;
  }
}
