import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/authentication_contorller.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/login_page_provider.dart';
import 'package:tms/view_models/login_page_view_model.dart';
import 'package:tms/res/strings/login.dart';

class LoginPage extends ConsumerWidget {
  final LoginPageViewModel _viewModel = LoginPageViewModel();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final String email = watch(emailProvider).state;
    final String password = watch(passwordProvider).state;
    final AuthenticationContorller _auth = watch(authServicesProvider);

    return Scaffold(
      body: Form(
        key: _viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                welcomeMessage,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              child: TextFormField(
                // onChanged: (value) => _viewModel.updateEmail(context, value),
                decoration: InputDecoration(
                  hintText: emailHintText,
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return emailValidateMsg;
                  } else if (value != null && value.contains('@') == false) {
                    return passwordFormatValidateMsg;
                  } else {
                    return null;
                  }
                },
                onSaved: (String? value) {
                  if (value != null) {
                    _viewModel.updateEmail(context, value);
                  }
                },
              ),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
              alignment: Alignment.center,
            ),
            Container(
              child: TextFormField(
                // onChanged: (value) => _viewModel.updatePassword(context, value),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: passwordHintText,
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return passWordValidateMsg;
                  } else {
                    return null;
                  }
                },
                onSaved: (String? value) {
                  if (value != null) {
                    _viewModel.updatePassword(context, value);
                  }
                },
              ),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              alignment: Alignment.center,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () => _viewModel.signIn(_auth, email, password),
                child: Text(
                  loginButtonLabel,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 5),
            ),
            Container(
              alignment: Alignment.center,
              child: OutlinedButton(
                onPressed: () => _auth.signUp(email: email, password: password),
                child: Text(
                  signUpButtonLabel,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  side: BorderSide(width: 1, color: Colors.blue),
                ),
              ),
              padding: EdgeInsets.fromLTRB(50, 5, 50, 20),
            ),
          ],
        ),
      ),
    );
  }
}
