import 'package:flutter/material.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:get/get_utils/get_utils.dart';

Future<List<Module>?> showSearchCoursesDialog({required BuildContext context, required List<Module> courses}) async {
  final TextEditingController searchController = TextEditingController();

  return showDialog<List<Module>>(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Buscar curso',
                  hintStyle: TextStyle(color: context.isDarkMode ? Colors.grey[400] : null),
                  filled: true,
                  fillColor: context.isDarkMode ? Color(0xFF1E1E1E) : null,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
                onSubmitted: (_) {
                  final query = searchController.text.trim();
                  final filtered = courses
                      .where((c) => c.title != null && c.title!.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                  Navigator.of(context).pop(filtered);
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFAE55EE)),
                  onPressed: () {
                    final query = searchController.text.trim();
                    final filtered = courses
                        .where((c) => c.title != null && c.title!.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    Navigator.of(context).pop(filtered);
                  },
                  child: const Text('Buscar', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
