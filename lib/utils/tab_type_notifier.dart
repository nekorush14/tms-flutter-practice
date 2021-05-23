import 'package:hooks_riverpod/hooks_riverpod.dart';

enum TabType {
  Analytics,
  Home,
  Mypage,
}

class TabTypeNotifier extends StateNotifier<TabType> {
  TabTypeNotifier(): super(TabType.Home);

  void reset() => state = TabType.Home;
  void setState(TabType selectedTabType) => state = selectedTabType;
  int get index => state.index;
  TabType get tab => state;
}
