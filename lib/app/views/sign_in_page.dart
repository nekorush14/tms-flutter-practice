import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/view_models/sign_in_page_view_model.dart';
import 'package:tms/app/views/sign_up_page.dart';
import 'package:tms/app/views/widgets/exception_dialog.dart';
import 'package:tms/providers/auth_providers.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/res/strings/auth.dart';
import 'package:tms/service/controllers/authentication_controller.dart';
import 'package:tms/utils/business_exception_handler.dart';

class LoginPage extends ConsumerWidget {
  final LoginPageViewModel _viewModel = LoginPageViewModel();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final AuthenticationController _auth = watch(authServicesProvider);
    final _exception = watch(businessExceptionProvider);

    return Scaffold(
      body: SafeArea(
        child: Form(
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
                child: Text(
                  signInButtonLabel,
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
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
                child: ElevatedButton(
                  onPressed: () async {
                    if (await _viewModel.signIn(_auth) == false
                    && _exception.content != null
                    && _exception.content != "") {
                      await showDialog(
                          context: context,
                          builder: (context) =>
                              ExceptionDialog(context, watch, null));
                    }
                  },
                  child: Text(
                    signInButtonLabel,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              ),
              Container(
                alignment: Alignment.center,
                child: OutlinedButton(
                  // onPressed: () => _auth.signUp(email: email, password: password),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SignUpPage()));
                  },
                  child: Text(
                    signUpButtonLabel,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
