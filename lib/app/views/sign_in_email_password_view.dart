import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/view_models/sign_in_email_password_view_model.dart';
import 'package:tms/controllers/auth_controller.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/res/labels/sign_in.dart';

class SignInWithEmailAndPassWordPageView extends ConsumerWidget {
  final SignInEmailPassWordViewModel _viewModel =
      SignInEmailPassWordViewModel();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AuthenticationController _auth = watch(authServicesProvider);
    return Scaffold(
      body: Form(
        key: _viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                welcomeMessageLbl,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              child: TextFormField(
                // onChanged: (value) => _viewModel.updateEmail(context, value),
                decoration: InputDecoration(
                  hintText: emailHintLbl,
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
                // onChanged: (value) => _viewModel.updatePassword(context, value),
                obscureText: true,
                decoration: InputDecoration(
                  hintText: passwordHintLbl,
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
                onPressed: () => _viewModel.signIn(_auth),
                child: Text(
                  signInButtonLbl,
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
