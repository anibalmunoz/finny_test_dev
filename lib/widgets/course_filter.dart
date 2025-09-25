import 'package:flutter/material.dart';

class CourseFilter extends StatelessWidget {
  final bool isActive;
  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  const CourseFilter({super.key, required this.isActive, required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isActive ? Color(0xFFEAECF0) : Color(0xFFDDB8FA)),
          color: isActive ? Color(0xFFDDB8FA) : null,
        ),
        child: Center(
          child: Row(
            children: [
              if (icon != null) Icon(icon, color: Color(0xFF400C5F)),
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Color(0xFF400C5F) : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
