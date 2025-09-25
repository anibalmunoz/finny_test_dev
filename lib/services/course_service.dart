import 'dart:convert';

import 'package:finny_test_dev/models/category_model.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CourseService {
  CourseService._privateConstructor();
  static final CourseService shared = CourseService._privateConstructor();

  Future<List<Module>> fetchData({CategoryModel? category}) async {
    final url = Uri.https('learn.microsoft.com', '/api/catalog/', {
      'locale': 'es-es',
      'type': 'modules',
      if (category != null) 'subject': category.subject,
    });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decoded = jsonDecode(response.body);
        final List<dynamic> data = decoded['modules'] ?? [];
        return ModelUtils.fromList(data, Module.fromJson);
      } else {
        debugPrint('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return [];
  }
}
