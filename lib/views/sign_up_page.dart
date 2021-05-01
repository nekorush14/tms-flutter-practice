import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/authentication_contorller.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/sign_up_page_provider.dart';
import 'package:tms/res/strings/sign_up.dart';
import 'package:tms/res/strings/login.dart';
import 'package:tms/view_models/sign_up_page_view_model.dart';

class SignUpPage extends ConsumerWidget {
  final SignUpPageViewModel _viewModel = SignUpPageViewModel();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final String displayName = watch(displayNameProvider).state;
    final String email = watch(emailProvider).state;
    final String password = watch(passwordProvider).state;
    final AuthenticationController _auth = watch(authServicesProvider);
    final bool signUpIsSucceed = watch(signUpProvider).state;

    return Scaffold(
      appBar: AppBar(title: Text(signUpPageTitle)),
      body: Form(
        key: _viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                signUpLabel,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: displayNameHint,
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return displayNameValidateMsg;
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
                decoration: InputDecoration(
                  hintText: emailHintText,
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return emailValidateMsg;
                  } else if (value != null && value.contains('@') == false) {
                    return emailFormatValidateMsg;
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
                    if (signUpIsSucceed) {
                      debugPrint(signUpIsSucceed.toString());
                      Navigator.pop(context);
                    }
                  }
                },
              ),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              alignment: Alignment.center,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  _viewModel.signUp(
                      context, _auth, displayName, email, password);
                },
                child: Text(
                  signUpButtonLabel,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 5),
            ),
          ],
        ),
      ),
    );
  }
}
