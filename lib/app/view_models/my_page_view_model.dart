import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/auth_providers.dart';

class MyPageViewModel extends StateNotifier {
  final ProviderContainer _container = new ProviderContainer();
  String name = "";

  MyPageViewModel() : super(null) {
    this.name = "";
  }

  Future<void> fetchUserName() async {
    while (this.name == "") {
      User? user = await _container
          .read(authServicesProvider)
          .fetchCurrentUserWithReload();
      String? name = user != null ? user.displayName : "";
      this.name = name != null ? name : "";
    }
  }

  String fetchUserEmail() {
    String? email =
        _container.read(authServicesProvider).fetchCurrentUser()!.email;

    if (email != null) {
      return email;
    } else {
      return "";
    }
  }
}
