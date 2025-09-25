import 'package:flutter/material.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/models/category_model.dart';
import 'package:finny_test_dev/services/course_service.dart';

class CoursesProvider extends ChangeNotifier {
  final int itemsPerPage;

  List<Module> _allCourses = [];
  List<Module> _displayedCourses = [];
  bool _isFiltered = false;
  int _currentMax = 10;
  int selectedIndex = 0;
  bool _isLoading = false;
  bool _isfetching = false;

  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool get isFetching => _isfetching;
  set isFetching(bool val) {
    _isfetching = val;
    notifyListeners();
  }

  CoursesProvider({this.itemsPerPage = 10});

  List<Module> get courses => _displayedCourses;
  bool get isFiltered => _isFiltered;
  int get currentMax => _currentMax;

  Future<void> loadCourses({CategoryModel? category}) async {
    isLoading = true;
    final data = await CourseService.shared.fetchData(category: category);
    _allCourses = data;
    _displayedCourses = List.from(_allCourses);
    _isFiltered = false;
    _currentMax = _allCourses.length < itemsPerPage ? _allCourses.length : itemsPerPage;
    isLoading = false;
  }

  Future<void> loadMore() async {
    isFetching = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    if (_currentMax < _displayedCourses.length) {
      _currentMax = (_currentMax + itemsPerPage).clamp(0, _displayedCourses.length);
    }
    isFetching = false;
  }

  void filterCourses(List<Module> filtered) {
    _displayedCourses = filtered;
    _isFiltered = true;
    _currentMax = _displayedCourses.length < itemsPerPage ? _displayedCourses.length : itemsPerPage;
    notifyListeners();
  }

  void clearFilter() {
    _displayedCourses = List.from(_allCourses);
    _isFiltered = false;
    _currentMax = _displayedCourses.length < itemsPerPage ? _displayedCourses.length : itemsPerPage;
    notifyListeners();
  }

  CategoryModel getCategoryBySubject(List<String> subjects) {
    for (var category in CourseService.shared.categories) {
      if (category.subject != null && subjects.contains(category.subject)) {
        return category;
      }
    }
    return CourseService.shared.categories[2];
  }

  void selectCategory(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
