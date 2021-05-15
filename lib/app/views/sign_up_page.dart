import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/service/controllers/authentication_controller.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/res/strings/auth.dart';
import 'package:tms/app/view_models/sign_up_page_view_model.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPageViewModel _viewModel = SignUpPageViewModel();

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
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () =>Navigator.of(context).pop(),

              ),

              alignment: Alignment.topLeft,
            ),
            Container(
              child: Text(
                welcomeMessage,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              child: Text(
                signUpButtonLabel,
                style: TextStyle(fontSize: 20),
              ),
              padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
              alignment: Alignment.center,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: displayNameHintText,
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
                    _viewModel.updateDisplayName(context, value);
                  }
                },
              ),
              padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
              alignment: Alignment.center,
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
              alignment: Alignment.center,
              child: ElevatedButton(
                // onPressed: () => _auth.signUp(email: email, password: password),
                onPressed: () async {
                  await _viewModel.signUp(_auth);
                  Navigator.of(context).pop();
                },
                child: Text(
                  signUpButtonLabel,
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
              ),
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            ),
          ],
        ),
      ),
    );
  }
}
