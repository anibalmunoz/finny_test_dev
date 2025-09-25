import 'dart:convert';

class ModelUtils {
  static List<T> fromList<T>(List<dynamic> data, T Function(Map<String, dynamic>) fromJson) {
    return List<T>.from(data.map((item) => fromJson(item)));
  }

  static List<T> fromDbList<T>(
    List<dynamic> data,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return List<T>.from(data.map((item) => fromJson(jsonDecode(item['jsondata']))));
  }
}
