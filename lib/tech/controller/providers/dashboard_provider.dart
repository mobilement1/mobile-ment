import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/dashboard_model.dart';
import 'package:mobile_servies/tech/service/dashboard_service.dart';

class DashboardProvider with ChangeNotifier {
  final DashboardService dashboardService = DashboardService();
  DashboardModelData? dashboardData;
  bool isLoading = false;
  String? error;

  Future<void> fetchDashboardData() async {
    if (isLoading) return; 
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      dashboardData = await dashboardService.fetchDashboardData();
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', ''); 
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}