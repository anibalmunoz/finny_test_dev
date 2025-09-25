import 'package:finny_test_dev/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static late SharedPreferences prefs;
  static bool _isDarkMode = false;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode => prefs.getBool(AppConfig.isDarkMode) ?? _isDarkMode;
  static set isDarkMode(bool isDarkMode) {
    _isDarkMode = isDarkMode;
    prefs.setBool(AppConfig.isDarkMode, isDarkMode);
  }

  static Future<void> saveValue(String key, Object value) async {
    switch (value.runtimeType) {
      case const (bool):
        await prefs.setBool(key, value as bool);
        break;
      case const (int):
        await prefs.setInt(key, value as int);
        break;
      case const (String):
        await prefs.setString(key, value as String);
        break;
    }
  }

  static Object? getValue(String key) {
    return prefs.get(key);
  }
}
