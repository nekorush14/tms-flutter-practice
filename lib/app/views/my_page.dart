import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/app/view_models/my_page_view_model.dart';
import 'package:tms/providers/auth_providers.dart';
import 'package:tms/providers/navigation_providers.dart';
import 'package:tms/providers/view_model_providers.dart';
import 'package:tms/service/controllers/authentication_controller.dart';
import 'package:tms/utils/tab_type_notifier.dart';

class MyPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _myPageViewModelProvider = useProvider(myPageViewModelProvider);
    final _auth = useProvider(authServicesProvider);
    final _tabTypeProvider = useProvider(tabTypeProvider.notifier);

    return FutureBuilder(
      future: _myPageViewModelProvider.fetchUserName(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return buildMyPageColumn(
              context, _myPageViewModelProvider, _auth, _tabTypeProvider);
        }
        //loading
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Column buildMyPageColumn(
      BuildContext context,
      MyPageViewModel _myPageViewModelProvider,
      AuthenticationController _auth,
      TabTypeNotifier _tabTypeProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'Home Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(
            'name: ${_myPageViewModelProvider.name}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(
            'email: ${_myPageViewModelProvider.fetchUserEmail()}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          alignment: Alignment.center,
        ),
        ElevatedButton(
          onPressed: () async {
            await _auth.signOut(context: context);
            _tabTypeProvider.reset();
          },
          child: Text('Sign-out'),
        ),
      ],
    );
  }
}
