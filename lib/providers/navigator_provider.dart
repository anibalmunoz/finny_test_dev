import 'package:flutter/material.dart';

class NavigatorProvider extends ChangeNotifier {
  int _selectedIndex = 2;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    if (_selectedIndex != value) {
      _selectedIndex = value;
      notifyListeners();
    }
  }
}
