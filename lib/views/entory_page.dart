// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/firebase_provider.dart';
// import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/login_page_provider.dart';
import 'package:tms/res/strings/login.dart';
import 'package:tms/view_models/entory_page_view_model.dart';
import 'package:tms/views/home_page.dart';

class EntoryPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final EntoryPageViewModel _viewModel = EntoryPageViewModel();

    // final User? authState = useProvider(authControllerProvider.state);
    final String email = watch(emailProvider).state;
    final String password = watch(passwordProvider).state;
    bool _isSuceed = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text(loginButtonLabel),
      ),
      body: ProviderListener(
        onChange: (
          BuildContext context,
          StateController<FirebaseAuthException?> firebaseAuthException,
        ) {
          _isSuceed = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(firebaseAuthException.state!.message!),
            ),
          );
        },
        provider: fireBaseExceptionProvider,
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
                      _viewModel.updateInputedEmail(context, value);
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
                      _viewModel.updateInputedPassword(context, value);
                    }
                  },
                ),
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                alignment: Alignment.center,
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(loginButtonLabel),
                  onPressed: () async {
                    _viewModel.signIn(context, email, password);
                    if (_isSuceed) {
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }),
                      );
                    }
                  },
                ),
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
              ),
              Container(
                child: OutlinedButton(
                  onPressed: () async {
                    _viewModel.signUp(context, email, password);
                    if (_isSuceed) {
                      await Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) {
                          return HomePage();
                        }),
                      );
                    }
                  },
                  child: Text(
                    signUpButtonLabel,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    side: BorderSide(width: 1, color: Colors.blue),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(50, 5, 50, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
