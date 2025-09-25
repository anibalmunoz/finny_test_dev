import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  AppTheme._privateConstructor();
  static final AppTheme shared = AppTheme._privateConstructor();

  bool isInDarkMode = Preferences.isDarkMode;

  Future changeTheme() async {
    final bool isDarkMode = Get.isDarkMode;
    Get.changeTheme(isDarkMode ? AppTheme.shared.lightTheme() : AppTheme.shared.darkTheme());
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    await Preferences.saveValue(AppConfig.isDarkMode, !isDarkMode);
  }

  ThemeData lightTheme() => ThemeData.light().copyWith(
    dividerColor: Colors.transparent,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.blue[100]))),
    dialogTheme: DialogThemeData(backgroundColor: Colors.white),
  );

  ThemeData darkTheme() => ThemeData.light().copyWith(
    dividerColor: Colors.transparent,
    brightness: Brightness.dark,
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.blue[100]))),
    appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 133, 65, 182), foregroundColor: Colors.white),
    scaffoldBackgroundColor: Color(0xFF2C2C2C),
    colorScheme: ColorScheme.dark(primary: Colors.white),
    cardTheme: CardThemeData(color: Colors.transparent, shadowColor: Colors.white24),
    checkboxTheme: CheckboxThemeData(fillColor: WidgetStatePropertyAll(Colors.white)),
    textTheme: ThemeData.dark().textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
