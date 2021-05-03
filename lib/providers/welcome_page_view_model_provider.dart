import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tms/app/view_models/welcome_page_view_model.dart';
import 'package:tms/providers/shared_preferences_service_provider.dart';

final welcomePageViewModelProvider =
    StateNotifierProvider<WelcomePageViewModel, dynamic>((ref) {
  final service = ref.watch(sharedPreferencesServiceProvider);
  return WelcomePageViewModel(service);
});
