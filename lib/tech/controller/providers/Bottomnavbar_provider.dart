import 'package:flutter/material.dart';

class TechNavigationProvider with ChangeNotifier {
  int selectedIndex = 0;


  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}