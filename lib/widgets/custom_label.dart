import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String label;
  final IconData icon;
  const CustomLabel({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: TextStyle(fontSize: 20)),
        const SizedBox(width: 10),
        Icon(icon),
      ],
    );
  }
}
