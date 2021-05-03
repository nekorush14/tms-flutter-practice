import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/login_page_provider.dart';
import 'package:tms/view_models/common/common_view_model.dart';

class EntoryPageViewModel extends CommonViewModel {
  final _formKey = GlobalKey<FormState>();
  get formKey => _formKey;

  /// Update Email prvider state with user inputed [email] address at called [context].
  void updateInputedEmail(BuildContext context, String email) {
    context.read(emailProvider).state = email;
  }

  /// Update Password prvider state with user inputed [password] at called [context].
  void updateInputedPassword(BuildContext context, String password) {
    context.read(passwordProvider).state = password;
  }

  /// Sign in to the system with valid formated [email] address and [password].
  bool signIn(BuildContext context, String email, String password) {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      context.read(authControllerProvider).signIn(email, password);
      return true;
    } else {
      return false;
    }
  }

  /// Sign up to the system with valid formated [email] address and [password].
  bool signUp(BuildContext context, String email, String password) {
    if (this._formKey.currentState!.validate()) {
      this._formKey.currentState!.save();
      context.read(authControllerProvider).signUp(email, password);
      return true;
    } else {
      return false;
    }
  }
}
