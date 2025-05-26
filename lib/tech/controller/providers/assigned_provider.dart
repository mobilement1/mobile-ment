import 'package:flutter/material.dart';

class AssignedTechProvider with ChangeNotifier {
  int? selectedIndex;

  void dropContainer(int index) {
    if (selectedIndex == index) {
      selectedIndex = null; 
    } else {
      selectedIndex = index;
    }
    notifyListeners();
  }
}
