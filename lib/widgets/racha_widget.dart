import 'package:flutter/material.dart';

class RachaWidget extends StatelessWidget {
  final String text;
  final String assetIcon;
  const RachaWidget({super.key, required this.text, required this.assetIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: const Color(0xFFF3E8FF), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetIcon),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: Color(0xFF7D52F4), fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
