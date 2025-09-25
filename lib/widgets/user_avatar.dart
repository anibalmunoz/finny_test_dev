import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String position;
  final String asset;
  const UserAvatar({super.key, required this.name, required this.position, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage(asset)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
              position,
              style: TextStyle(fontSize: 16, color: context.isDarkMode ? Colors.white70 : AppColors.shared.gray1),
            ),
          ],
        ),
      ],
    );
  }
}
