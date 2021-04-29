import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/authentication_contorller.dart';
import 'package:tms/providers/login_page_provider.dart';

class LoginPageViewModel extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  get formKey => _formKey;

  /// Update Email prvider state with user inputed [email] address at called [context].
  void updateEmail(BuildContext context, String email) {
    context.read(emailProvider).state = email;
  }

  /// Update Password prvider state with user inputed [password] at called [context].
  void updatePassword(BuildContext context, String password) {
    context.read(passwordProvider).state = password;
  }

  /// Sign in to the system with valid formated [email] address and [password].
  void signIn(AuthenticationController _auth, String email, String password) {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      _auth.signIn(email: email, password: password);
    }
  }
}
