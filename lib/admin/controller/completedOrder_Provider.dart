import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/completedOrder_admin_model.dart';
import 'package:mobile_servies/admin/service/completed_order_admin_service.dart';

class CompletedorderProvider with ChangeNotifier {
  final CompletedOrderService service;
  List<CompletedOrder> completedOrders = [];
  bool isLoading = false;
  String? error;

  CompletedorderProvider(this.service);

  Future<void> fetchCompletedOrders({
    String? technicianId,
    String? searchString,
  }) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      completedOrders = await service.getCompletedOrders(
        technicianId: technicianId,
        searchString: searchString,
      );
    } catch (e) {
      error = e.toString().contains('Unauthorized')
          ? 'Authentication failed. Please log in again.'
          : e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}