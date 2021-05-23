import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/app/views/analytics_page.dart';
import 'package:tms/app/views/my_page.dart';
import 'package:tms/app/views/widgets/bottom_navigation_bar.dart';
import 'package:tms/app/views/widgets/home_page_widget.dart';
import 'package:tms/providers/navigation_providers.dart';
import 'package:tms/providers/view_model_providers.dart';
import 'package:tms/utils/tab_type_notifier.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _homePageViewModel = watch(homePageViewModelProvider);
    final _tabTypeNotifier = watch(tabTypeProvider.notifier);
    final _tabTypeProvider = watch(tabTypeProvider);
    // List of body contents which has home page, analytics page, and my page
    final _views = [AnalyticsPage(), HomePageWidget(), MyPage()];

    return SafeArea(
      child: FutureBuilder(
        future: _homePageViewModel.fetchUserName(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something Went wrong"),
            );
          }
          // Yield main contents
          if (snapshot.connectionState == ConnectionState.done) {
            return buildHomePageScaffold(
                context, _views, _tabTypeNotifier, _tabTypeProvider);
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

  Scaffold buildHomePageScaffold(BuildContext context, List<HookWidget> _views,
      TabTypeNotifier tabType, TabType tabTypeProvider) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EnumToString.convertToString(
            tabType.tab)),
      ),
      // Body content show which user selected at bottom navigation bar
      body: _views[tabTypeProvider.index],
      bottomNavigationBar: buildBottomNavigationBar(context, tabType),
    );
  }
}
