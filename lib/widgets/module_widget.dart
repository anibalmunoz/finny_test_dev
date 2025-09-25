import 'dart:math';

import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuleWidget extends StatelessWidget {
  final String title;
  const ModuleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    int minutos = 4 + random.nextInt(20);

    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/video.png'),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Image.asset('assets/icons/clock-five-opa.png'),
                    const SizedBox(width: 5),
                    Text(
                      '$minutos minutos',
                      style: TextStyle(
                        fontSize: 16,
                        color: context.isDarkMode ? Colors.white70 : AppColors.shared.gray1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
