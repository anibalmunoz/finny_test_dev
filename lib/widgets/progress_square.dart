import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ProgressSquare extends StatelessWidget {
  final String quantity;
  final String label;

  const ProgressSquare({super.key, required this.quantity, required this.label});

  @override
  Widget build(BuildContext context) {
    Color color = Color(0xFF3D1E53);

    return Container(
      width: 85,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(color: context.isDarkMode ? Colors.white : color),
      ),
      child: Column(
        children: [
          Text(
            quantity,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: context.isDarkMode ? Color(0xFFDDB8FA) : color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: context.isDarkMode ? Color(0xFFDDB8FA) : color)),
        ],
      ),
    );
  }
}
