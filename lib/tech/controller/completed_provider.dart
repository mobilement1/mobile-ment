import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/complete_model.dart';
import 'package:mobile_servies/tech/service/completed_service.dart';
import 'package:mobile_servies/user/UserServices/user_authService.dart';

class CompletedTechProvider with ChangeNotifier {
  final CompletedTaskService taskService = CompletedTaskService();
  final UserAuthService authService = UserAuthService();

  List<CompletedModel> completedTasks = [];
  int selectedIndex = -1;
  bool isLoading = false;
  String? errorMessage;
  Map<String, int> taskCounts = {
    'Assigned': 0,
    'InProgress': 0,
    'Completed': 0,
  };

  Future<void> initialize() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await Future.wait([
          fetchCompletedTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        completedTasks = [];
        taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      }
    } catch (e) {
      errorMessage = 'Failed to initialize data: $e';
      completedTasks = [];
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchCompletedTasks(String technicianId, {String? searchString}) async {
    try {
      completedTasks = await taskService.fetchCompletedTasks(
        technicianId: technicianId,
        status: 'Completed',
        searchString: searchString,
      );
    } catch (e) {
      errorMessage = 'Failed to fetch completed tasks: $e';
      completedTasks = [];
      throw Exception('Failed to fetch completed tasks: $e');
    }
  }

  Future<void> fetchTaskCounts(String technicianId) async {
    try {
      taskCounts = await taskService.fetchTaskCounts(technicianId);
    } catch (e) {
      errorMessage = 'Failed to fetch task counts: $e';
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      throw Exception('Failed to fetch task counts: $e');
    }
  }

  void dropContainer(int index) {
    selectedIndex = selectedIndex == index ? -1 : index;
    notifyListeners();
  }

  Future<void> fetchCompletedTasksWithSearch(String? searchString) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await fetchCompletedTasks(technicianId, searchString: searchString);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        completedTasks = [];
      }
    } catch (e) {
      errorMessage = 'Failed to search completed tasks: $e';
      completedTasks = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}