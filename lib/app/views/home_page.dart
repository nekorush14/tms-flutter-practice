import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/providers/auth_providers.dart';
import 'package:tms/providers/home_page_view_model_providers.dart';

class HomePage extends ConsumerWidget {
  // HomePageViewModel _viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _homePageViewModel = watch(homePageViewModelProvider);
    final _auth = watch(authServicesProvider);

    return SafeArea(
      child: FutureBuilder(
        future: _homePageViewModel.fetchUserName(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something Went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Home Page',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'name: ${_homePageViewModel.name}',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'email: ${_homePageViewModel.fetchUserEmail()}',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _auth.signOut(),
                    child: Text('Sign-out'),
                  ),
                ],
              ),
            );
          }
          //loading
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
