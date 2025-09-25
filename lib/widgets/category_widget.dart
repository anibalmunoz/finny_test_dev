import 'package:finny_test_dev/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all(color: context.isDarkMode ? Color(0xFFDDB8FA) : Colors.black26),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(category.iconAsset ?? ''),
          const SizedBox(width: 5),
          Text(category.label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
    );
  }
}
