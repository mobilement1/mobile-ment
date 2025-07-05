import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/technicianList_model.dart';
import 'package:mobile_servies/admin/service/technicianList_sevice.dart';

class TechnicianListProvider with ChangeNotifier {
  final TechnicianListService technicianService = TechnicianListService();

  List<TechnicianListModel> technicians = [];
  List<TechnicianListModel> searchTechniciansList = [];
  List<TechnicianListModel> searchedList = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchTechnicians({String? technicianId}) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      log('Fetching technicians with technicianId: $technicianId');
      technicians = await technicianService.getTechnicians(
        technicianId: technicianId,
      );
      searchTechniciansList = List.from(technicians);
      searchedList = List.from(technicians);
      log('Successfully fetched ${technicians.length} technicians');
      if (technicians.isEmpty) {
        error = 'No technicians found';
      }
    } catch (e) {
      error = e.toString().replaceFirst('Exception: ', '');
      technicians = [];
      searchTechniciansList = [];
      searchedList = [];
      log('Error fetching technicians: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Refresh technicians
  Future<void> refreshTechnicians() async {
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

  Future<void> blockTechnician(String technicianId, bool shouldBlock, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await technicianService.blockTechnician(technicianId, shouldBlock);

      await fetchTechnicians();

      final index = technicians.indexWhere((e) => e.id == technicianId);
      if (index != -1) {
        technicians[index] = technicians[index].copyWith(isBlocked: shouldBlock);
        searchTechniciansList = List.from(technicians);
        searchedList = List.from(technicians);
        notifyListeners();
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            shouldBlock
                ? 'Technician blocked successfully'
                : 'Technician unblocked successfully',
          ),
          backgroundColor: shouldBlock ? Colors.red : Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update technician status: ${e.toString().replaceFirst('Exception: ', '')}'),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchFn(String search) async {
    if (search.isEmpty) {
      searchedList = List.from(searchTechniciansList);
    } else {
      searchedList = searchTechniciansList.where((technician) {
        return technician.name.toLowerCase().startsWith(search.toLowerCase()) ||         
            technician.location.toLowerCase().startsWith(search.toLowerCase()) ||
            technician.contactEmail.toLowerCase().startsWith(search.toLowerCase()) ||
            technician.specialized.toLowerCase().startsWith(search.toLowerCase()) ||
            technician.experienceText.toLowerCase().startsWith(search.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}