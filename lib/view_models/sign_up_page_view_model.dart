import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/authentication_contorller.dart';
import 'package:tms/providers/sign_up_page_provider.dart';

class SignUpPageViewModel extends ChangeNotifier {
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

  /// Update Password prvider state with user inputed [displayName] at called [context].
  void updateDisplayName(BuildContext context, String displayName) {
    context.read(displayNameProvider).state = displayName;
  }

  /// Sign up to the system with valid formated [displayName], [email] address and [password].
  void signUp(BuildContext context, AuthenticationController _auth,
      String displayName, String email, String password) {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      Future<bool> isSuceed =
          _auth.signUp(name: displayName, email: email, password: password);

      context.read(signUpProvider).state = isSuceed as bool;
    }
  }
}
