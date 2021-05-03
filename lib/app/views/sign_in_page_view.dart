import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/view_models/sign_in_page_view_model.dart';
import 'package:tms/app/views/widgets/show_diarog_widget.dart';
import 'package:tms/app/views/widgets/sign_in_page_widget.dart';
import 'package:tms/providers/sing_in_model_provider.dart';
import 'package:tms/res/labels/sign_in.dart';

class SignInPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final signInModel = watch(signInModelProvider);
    return ProviderListener<SignInPageViewModel>(
      provider: signInModelProvider,
      onChange: (context, model) {
        if (model.error != null) {
          ShowDialogWidget(
            context: context,
            title: signInFailedLbl,
            exception: model.error,
          );
        }
      },
      child: SignInPageWidget(
        viewModel: signInModel,
        title: 'Architecture Demo',
      ),
    );
  }
}
