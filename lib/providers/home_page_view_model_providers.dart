import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tms/app/view_models/home_page_view_model.dart';

final homePageViewModelProvider = Provider.autoDispose((ref) {
  return HomePageViewModel();
});

final userNameProvider = StateProvider.autoDispose<String>((ref) => "");
