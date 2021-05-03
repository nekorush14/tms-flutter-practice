import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/views/widgets/show_diarog_widget.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/res/labels/authentication.dart';
import 'package:tms/res/messages/authentication.dart';

class AuthenticationWidget extends ConsumerWidget {
  /// Widget builder used when user not signed in to the system
  final WidgetBuilder nonSignedInBuilder;

  /// Widget builder used when user has alrady signed in to the system
  final WidgetBuilder signedInBuilder;

  /// Constructor
  ///
  /// Initialize the [siginedInbuilder] and [nonSignInBuilder]
  const AuthenticationWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateChangesProvider);
    return _authState.when(
      data: (user) => _data(context, user),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => Scaffold(
        body: ShowDialogWidget(
          title: authErrorDialogTitleLbl,
          message: authErrorMsg,
          context: context,
        ),
      ),
    );
  }

  Widget _data(BuildContext context, User? user) {
    if (user != null) {
      return signedInBuilder(context);
    }
    return nonSignedInBuilder(context);
  }
}
