import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/controllers/authentication_contorller.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/providers/login_page_provider.dart';
import 'package:tms/view_models/login_page_view_model.dart';

class LoginPage extends ConsumerWidget {
  final _viewModel = LoginPageViewModel();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final String email = watch(emailProvider).state;
    final String pass = watch(passwordProvider).state;
    final AuthenticationContorller _auth = watch(authServicesProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          TextField(
            onChanged: (value) => _viewModel.updateEmail(context, value),
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          TextField(
            onChanged: (value) => _viewModel.updatePassword(context, value),
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () => _auth.signIn(email: email, password: pass),
            child: Text('Sign-in'),
          ),
        ],
      ),
    );
  }
}
