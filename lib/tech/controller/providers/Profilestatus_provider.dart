import 'package:flutter/material.dart';

class AssistiveTouchFabProvider extends ChangeNotifier {
  bool isExpanded = false;
  String currentStatus = 'Online';

  final List<String> statuses = ['Online', 'Busy', 'Offline'];

  final Map<String, Color> statusColors = {
    'Online': Colors.green,
    'Busy': Colors.red,
    'Offline': Colors.grey,
  };


  void toggleExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void close() {
    isExpanded = false;
    notifyListeners();
  }

  void setStatus(String status) {
    currentStatus = status;
    notifyListeners();
  }
}
