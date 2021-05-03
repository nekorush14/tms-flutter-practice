import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/providers/auth_provider.dart';
import 'package:tms/view_models/common/common_view_model.dart';

class MenuPageViewModel extends CommonViewModel {
  late Future<User?> _currentUser;
  get curentUser => _currentUser;

  MainPageViewModel(BuildContext context) {
    Future<User?> currentUser =
        context.read(authControllerProvider).fetchCurrentUser();
    _currentUser = currentUser;
  }

  Future<User?> fetchCurrentUser(BuildContext context) {
    Future<User?> currentUser =
        context.read(authControllerProvider).fetchCurrentUser();
    _currentUser = currentUser;

    return _currentUser;
  }
}
