import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_servies/admin/Model/tech_reqst_admin_model.dart';
import 'package:mobile_servies/admin/service/tech_rqst_service_admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianRequestProvider with ChangeNotifier {
  List<TechnicianRequest> requests = [];
  bool isLoading = false;
  String? errorMessage;
  String statusFilter = 'All';
  String searchQuery = '';

  final TechnicianRequestService _service = TechnicianRequestService();

  Future<bool> _checkTokenValidity() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('auth_token');
    if (token == null || token.isEmpty) return false;

    try {
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      final int exp = decodedToken['exp'];
      final DateTime expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      return expiryDate.isAfter(DateTime.now());
    } catch (e) {
      log('Error decoding token: $e');
      return false;
    }
  }

  Future<void> fetchRequests() async {
    if (!(await _checkTokenValidity())) {
      errorMessage = 'Session expired. Please log in again.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      requests = await _service.fetchTechnicianRequests(
        status: statusFilter == 'All' ? null : statusFilter,
        search: searchQuery.isEmpty ? null : searchQuery,
      );
      log('Fetched ${requests.length} requests with filter: $statusFilter');
      isLoading = false;
      notifyListeners();
    } catch (e) {
      // Only set errorMessage for unhandled errors
      if (e.toString().contains('Requests not found')) {
        requests = [];
      } else {
        errorMessage = e.toString().replaceFirst('Exception: ', '');
      }
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateRequestStatus({
    required String technicianRequestId,
    required bool status,
    String? adminRemarks,
  }) async {
    if (!(await _checkTokenValidity())) {
      errorMessage = 'Session expired. Please log in again.';
      notifyListeners();
      return false;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final success = await _service.updateRequestStatus(
        technicianRequestId: technicianRequestId,
        status: status,
        adminRemarks: adminRemarks,
      );
      if (success) {
        await fetchRequests();
        if (status) {
          errorMessage = 'Technician request approved! User is now a Technician.';
        } else {
          errorMessage = 'Technician request rejected.';
        }
      } else {
        errorMessage = 'Failed to update request status.';
      }
      isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      errorMessage = e.toString().replaceFirst('Exception: ', '');
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void setStatusFilter(String newFilter) {
    statusFilter = newFilter;
    log('Status filter set to: $statusFilter');
    fetchRequests();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    log('Search query set to: $searchQuery');
    fetchRequests();
  }

  void clearErrorMessage() {
    errorMessage = null;
    notifyListeners();
  }
}