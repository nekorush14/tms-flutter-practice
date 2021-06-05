import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/app/views/widgets/plan_list_widget.dart';
import 'package:tms/providers/view_model_providers.dart';
import 'package:tms/res/strings/labels.dart';

class HomePageWidget extends HookWidget {
  const HomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homePageViewModel = useProvider(homePageViewModelProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Menu:',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 30, 15, 70),
              ),
              Container(
                child: Text(
                  'Welcome ${_homePageViewModel.name}.',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 70),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Text(
                  menuUpcomingTitleLbl,
                  style: TextStyle(fontSize: 24),
                ),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              ),
              // TODO: Change Container widget to ListView widget.
              Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.task),
                        title: Text('Dummy plan'),
                        subtitle: Text('Dummy Description'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text(editBtnLbl),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text(finishBtnLbl),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          PlanListWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
