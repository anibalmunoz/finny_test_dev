import 'package:finny_test_dev/services/course_service.dart';
import 'package:flutter/material.dart';
import 'package:finny_test_dev/models/module_model.dart';
import 'package:finny_test_dev/models/category_model.dart';
import 'package:finny_test_dev/repositories/favorites_repository.dart';

class FavoritesProvider extends ChangeNotifier {
  final int itemsPerPage;

  List<Module> _allFavorites = [];
  List<Module> _displayedFavorites = [];
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

  FavoritesProvider({this.itemsPerPage = 10});

  List<Module> get favorites => _displayedFavorites;
  int get currentMax => _currentMax;

  Future<void> loadFavorites() async {
    isLoading = true;
    final data = await FavoritesRepository.shared.getAll();
    _allFavorites = data;
    _displayedFavorites = List.from(_allFavorites);
    _currentMax = _displayedFavorites.length < itemsPerPage ? _displayedFavorites.length : itemsPerPage;
    isLoading = false;
  }

  Future<void> loadMore() async {
    if (_currentMax < _displayedFavorites.length) {
      isFetching = true;
      await Future.delayed(const Duration(milliseconds: 1500));
      _currentMax = (_currentMax + itemsPerPage).clamp(0, _displayedFavorites.length);
    }
    isFetching = false;
  }

  void selectCategory(int index) {
    selectedIndex = index;
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

  Future<void> refreshFavorites() async {
    await loadFavorites();
  }
}
