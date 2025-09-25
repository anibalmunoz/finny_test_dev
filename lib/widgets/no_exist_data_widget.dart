import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoExistData extends StatelessWidget {
  final String text;
  final IconData icon;
  const NoExistData({super.key, required this.text, this.icon = CupertinoIcons.exclamationmark_triangle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: MediaQuery.of(context).size.width * 0.2,
            color: Get.isDarkMode ? Colors.white : Color(0xFFAE55EE),
          ),
          Text(text, style: TextStyle(fontSize: 19)),
        ],
      ),
    );
  }
}
