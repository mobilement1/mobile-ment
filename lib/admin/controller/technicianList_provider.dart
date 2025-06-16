import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:mobile_servies/admin/Model/technicianList_model.dart';
import 'package:mobile_servies/admin/service/technicianList_sevice.dart';

class TechnicianListProvider with ChangeNotifier {
  final TechnicianListService technicianService = TechnicianListService();

  List<TechnicianListModel> technicians = [];
  bool isLoading = false;
  String? error;
  String? searchQuery;

  // Fetch technicians with search
  Future<void> fetchTechnicians({String? technicianId, String? search}) async {
    isLoading = true;
    error = null;
    searchQuery = search;
    notifyListeners();

    try {
      log('Fetching technicians with technicianId: $technicianId, search: $search');
      technicians = await technicianService.getTechnicians(
        technicianId: technicianId,
        search: search,
      );
      log('Successfully fetched ${technicians.length} technicians');
    } catch (e) {
      error = e.toString();
      technicians = [];
      log('Error fetching technicians: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Refresh technicians
  Future<void> refreshTechnicians() async {
    await fetchTechnicians(search: searchQuery);
  }

  // Clear search and reset to original list
  Future<void> clearSearch() async {
    searchQuery = null;
    await fetchTechnicians();
  }

  // Get technician by ID
  TechnicianListModel? getTechnicianById(String id) {
    try {
      return technicians.firstWhere((tech) => tech.id == id);
    } catch (e) {
      return null;
    }
  }
}