import 'package:flutter/material.dart';
import 'package:tms/app/view_models/sign_in_page_view_model.dart';
import 'package:tms/res/labels/sign_in.dart';
import 'package:tms/utils/constants.dart';

class SignInPageWidget extends StatelessWidget {
  final SignInPageViewModel viewModel;
  final String title;

  SignInPageWidget(
      {Key? key, required this.viewModel, this.title = "Default Title"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: _buildPage(context),
    );
  }

  Widget _buildPageLbl() {
    if (this.viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Text(
        signInLbl,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600),
      );
    }
  }

  Widget _buildPage(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: _buildPageLbl(),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(signInWithEmailAndPasswordBtnLbl),
                  onPressed: viewModel.isLoading
                      ? null
                      : () => _buildSignInWithEmailAndPasswordPage(context),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(signInOrSepalatorLbl),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text(signInAsAnonymousBtnLbl),
                  onPressed:
                      viewModel.isLoading ? null : viewModel.signInAnonymously,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _buildSignInWithEmailAndPasswordPage(
      BuildContext context) async {
    final NavigatorState navigator = Navigator.of(context);
    await navigator.pushNamed(signInWithEmailAndPasswordPage);
  }
}
