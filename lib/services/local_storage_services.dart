import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageKeys {
  static final String loginKey = 'isLoggined';
  static final String themeValue = 'themeValue';
}

class LocalStorageServices {
  static late SharedPreferences _preferences;

  /// Initlize
  static Future<void> initlize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// set a bool value
  static Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  /// get a bool value
  static bool? getBool(String key) {
    return _preferences.getBool(key);
  }
}
