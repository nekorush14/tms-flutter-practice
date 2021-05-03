import 'package:state_notifier/state_notifier.dart';
import 'package:tms/controllers/shared_preferences_controller.dart';

class WelcomePageViewModel extends StateNotifier<bool> {
  final SharedPreferencesController _service;

  WelcomePageViewModel(this._service) : super(_service.isReachComplete);

  Future<void> completeReaching() async {
    await _service.reachComplete();
    super.state = true;
  }

  bool get isReachingComplete => super.state;
}
