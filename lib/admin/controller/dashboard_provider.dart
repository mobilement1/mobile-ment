import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/dashboard_model.dart';
import 'package:mobile_servies/admin/service/dashboard_service.dart';

class AdminDashboardProvider with ChangeNotifier {
  final DashboardService dashboardService;
  AdminDashboardMetrics? _metrics;
  bool _isLoading = false;
  String? _error;
  CancelToken? _cancelToken;

  AdminDashboardProvider({DashboardService? service})
      : dashboardService = service ?? DashboardService();

  AdminDashboardMetrics? get metrics => _metrics;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchDashboardData() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    try {
      _metrics = await dashboardService.getDashboardData();
      _error = null;
    } catch (e) {
      _error = e.toString();
      log('Error fetching dashboard data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


 

  List<FlSpot> getRevenueSpots() {
    if (_metrics == null || _metrics!.revenueChartData.isEmpty) {
      return [const FlSpot(0, 0)];
    }
    
    return _metrics!.revenueChartData
        .asMap()
        .entries
        .map((entry) => FlSpot(
              entry.key.toDouble(),
              entry.value.revenue / 1000,
            ))
        .toList();
  }

  List<FlSpot> getExpenseSpots() {
    if (_metrics == null || _metrics!.revenueChartData.isEmpty) {
      return [const FlSpot(0, 0)];
    }
    
    return _metrics!.revenueChartData
        .asMap()
        .entries
        .map((entry) => FlSpot(
              entry.key.toDouble(),
              entry.value.expense / 1000,
            ))
        .toList();
  }

  List<PopularService> getPopularServices() {
    return _metrics?.popularChartData ?? [];
  }

  @override
  void dispose() {
    _cancelToken?.cancel();
    super.dispose();
  }
}