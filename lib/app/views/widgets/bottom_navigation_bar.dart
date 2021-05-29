import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/providers/navigation_providers.dart';
import 'package:tms/providers/util_providers.dart';
import 'package:tms/utils/tab_type_notifier.dart';

import 'exception_dialog.dart';

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, TabTypeNotifier tabType) {
  return BottomNavigationBar(
    // selectedItemColor: Colors.black,
    // unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.analytics),
        label: 'Analytics',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'My Page',
      ),
    ],
    onTap: (int selectIndex) async {
      // TODO: Remove this branch process when analytics page implementation has been completed.
      if (selectIndex == 0) {
        context
            .read(businessExceptionProvider)
            .create("Un supported function", "Currently unavailable");
        await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => ExceptionDialog(context, null));
      } else {
        tabType.setState(TabType.values[selectIndex]);
      }
    },
    currentIndex: context.read(tabTypeProvider.notifier).index,
  );
}
