import 'package:finny_test_dev/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget getCustomAppBar({final List<Widget>? actions}) {
  return AppBar(
    title: Image.asset(Get.isDarkMode ? 'assets/images/logo_dark.png' : 'assets/images/Logo.png'),
    actions: [
      IconButton(
        onPressed: () => AppTheme.shared.changeTheme(),
        icon: Icon(Get.context!.isDarkMode ? Icons.dark_mode : Icons.light_mode),
      ),
      IconButton(onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined)),
      IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
    ],
  );
}
