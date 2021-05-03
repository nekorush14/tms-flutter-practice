import 'package:shared_preferences/shared_preferences.dart';
import 'package:tms/utils/constants.dart';

class SharedPreferencesController {
  final SharedPreferences _sharedPreferences;
  SharedPreferencesController(this._sharedPreferences);

  Future<void> reachComplete() async {
    await _sharedPreferences.setBool(reachCompleteKey, true);
  }

  bool get isReachComplete =>
      _sharedPreferences.getBool(reachCompleteKey) ?? false;
}
