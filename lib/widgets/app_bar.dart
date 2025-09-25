import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget getCustomAppBar({final List<Widget>? actions}) {
  return AppBar(
    title: Image.asset(Get.isDarkMode ? 'assets/images/logo_dark.png' : 'assets/images/Logo.png'),
    actions: actions,
  );
}
