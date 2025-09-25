import 'package:finny_test_dev/pages/home_page/home_page.dart';
import 'package:finny_test_dev/providers/navigator_provider.dart';
import 'package:finny_test_dev/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'themes/app_theme.dart';

void main() async {
  await _initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavigatorProvider())],
      child: const MyApp(),
    ),
  );
}

Future<void> _initializeApp() async {
  await Preferences.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Finny frontend test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.shared.lightTheme(),
      darkTheme: AppTheme.shared.darkTheme(),
      themeMode: AppTheme.shared.isInDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
