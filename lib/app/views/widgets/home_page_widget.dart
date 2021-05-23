import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/view_model_providers.dart';

class HomePageWidget extends HookWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homePageViewModel = useProvider(homePageViewModelProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'Menu',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Container(
          child: Text(
            'name: Welcome ${_homePageViewModel.name}.',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}