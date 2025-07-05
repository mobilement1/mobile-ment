

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/estimateModel.dart';
import 'package:mobile_servies/user/UserServices/RepairServices/estmatedService.dart';

class Estimatedprovider extends ChangeNotifier {
  final Estmatedservice service = Estmatedservice();

  String? selectedTechnicianID;
  String? selectedAddressID;
  String? selectedServiceID;

  Estimatemodel? estimateData;
  String errorMessage = '';
bool isEstimatedLoading=false;
  // Set all required IDs before fetching
  void setIDs({
    required String technicianId,
    required String addressId,
    required String serviceId,
  }) {
    selectedTechnicianID = technicianId;
    selectedAddressID = addressId;
    selectedServiceID = serviceId;
    notifyListeners();
  }

  Future<void> fetchEstimateAfterBooking() async {
  if (selectedTechnicianID == null ||
      selectedAddressID == null ||
      selectedServiceID == null) {
    errorMessage = "Missing ID values";
    notifyListeners();
    return;
  }

  isEstimatedLoading = true;
  notifyListeners();

  try {
    final data = await service.fetchbookingsEstimate(
      technicianId: selectedTechnicianID!,
      addressId: selectedAddressID!,
      serviceId: selectedServiceID!,
    );

    if (data != null) {
      estimateData = data;
      errorMessage = '';
      log("✅ Estimate fetched successfully: ₹${data.totalCost}");
    } else {
      estimateData = null;
      errorMessage = "Failed to fetch estimate";
      log("❌ Estimate fetch returned null");
    }
  } catch (e) {
    estimateData = null;
    errorMessage = "Exception: $e";
    log("❌ Exception in estimate fetch: $e");
  }

  isEstimatedLoading = false;
  notifyListeners();
}


// 🔁 ADD this method to fetch estimate using BookingModelUser directly
Future<void> fetchEstimateForBooking({
  required String technicianId,
  required String addressId,
  required String serviceId,
}) async {
  selectedTechnicianID = technicianId;
  selectedAddressID = addressId;
  selectedServiceID = serviceId;

  await fetchEstimateAfterBooking(); // reuse your existing logic
}


}