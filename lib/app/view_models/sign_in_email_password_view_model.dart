import 'package:flutter/material.dart';
import 'package:tms/controllers/auth_controller.dart';

class SignInEmailPassWordViewModel {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  SignInEmailPassWordViewModel({this.email = "", this.password = ""});

  get formKey => _formKey;

  /// Update Email prvider state with user inputed [email] address at called [context].
  void updateEmail(BuildContext context, String email) {
    this.email = email;
  }

  /// Update Password prvider state with user inputed [password] at called [context].
  void updatePassword(BuildContext context, String password) {
    this.password = password;
  }

  /// Sign in to the system with valid formated email address and password.
  void signIn(AuthenticationController auth) {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      auth.signIn(email: this.email, password: this.password);
    }
  }
}
