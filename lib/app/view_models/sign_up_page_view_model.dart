import 'package:flutter/material.dart';
import 'package:tms/service/controllers/authentication_controller.dart';

class SignUpPageViewModel {
  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  String email = "";
  String password = "";
  String displayName = "";

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

  /// Update DisplayName provider state with user inputted [displayName] at called [context].
  void updateDisplayName(BuildContext context, String displayName) {
    // context.read(displayNameProvider).state = displayName;
    this.displayName = displayName;
  }

  /// Sign in to the system with valid formatted email address and password.
  ///
  /// Return [true] when sign up has been succeed, otherwise return [false].
  Future<bool> signUp(BuildContext context, AuthenticationController _auth) async {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      return await _auth.signUp(context: context,
          displayName: displayName, email: email, password: password);
    }
    return false;
  }
}
