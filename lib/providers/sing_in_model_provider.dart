import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/view_models/sign_in_page_view_model.dart';
import 'package:tms/providers/auth_provider.dart';

final signInModelProvider = ChangeNotifierProvider<SignInPageViewModel>(
  (ref) => SignInPageViewModel(auth: ref.watch(firebaseAuthProvider)),
);
