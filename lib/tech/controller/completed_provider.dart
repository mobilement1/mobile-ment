import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/complete_model.dart';
import 'package:mobile_servies/tech/service/completed_service.dart';
import 'package:mobile_servies/user/UserServices/AuthService/user_authService.dart';


class CompletedTechProvider with ChangeNotifier {
  final CompletedTaskService taskService = CompletedTaskService();
  final UserAuthService authService = UserAuthService();

  List<CompletedModel> completedTasks = [];
  List<CompletedModel> searchCompletedList = [];
  List<CompletedModel> searchedList = [];
  int selectedIndex = -1;
  bool isFirstLoad = true;

  bool isLoading = false;
  String? errorMessage;
  Map<String, int> taskCounts = {
    'Assigned': 0,
    'InProgress': 0,
    'Completed': 0,
  };

  Future<void> initialize() async {
    isLoading = true;
     isFirstLoad = true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await Future.wait([
          fetchCompletedTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
        // Initialize search lists
        searchCompletedList = List.from(completedTasks);
        searchedList = List.from(completedTasks);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        completedTasks = [];
        searchCompletedList = [];
        searchedList = [];
        taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      }
    } catch (e) {
      errorMessage = 'Failed to initialize data: $e';
      completedTasks = [];
      searchCompletedList = [];
      searchedList = [];
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
    } finally {
      isLoading = false;
      isFirstLoad = false;
      notifyListeners();
    }
  }

   Future<void> refreshCompleted() async {
    await initialize();
  }

  Future<void> fetchCompletedTasks(String technicianId) async {
    try {
      completedTasks = await taskService.fetchCompletedTasks(
        technicianId: technicianId,
        status: 'Completed',
      );
     
      searchCompletedList = List.from(completedTasks);
      searchedList = List.from(completedTasks);
    } catch (e) {
      errorMessage = 'Failed to fetch completed tasks: $e';
      completedTasks = [];
      searchCompletedList = [];
      searchedList = [];
      throw Exception('Failed to fetch completed tasks: $e');
    }
    notifyListeners();
  }

  Future<void> fetchTaskCounts(String technicianId) async {
    try {
      taskCounts = await taskService.fetchTaskCounts(technicianId);
    } catch (e) {
      errorMessage = 'Failed to fetch task counts: $e';
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      throw Exception('Failed to fetch task counts: $e');
    }
    notifyListeners();
  }

  void dropContainer(int index) {
    selectedIndex = selectedIndex == index ? -1 : index;
    notifyListeners();
  }

  Future<void> searchFn(String search) async {
    if (search.isEmpty) {
      searchedList = List.from(searchCompletedList);
    } else {
      searchedList = searchCompletedList.where((task) {
        return task.customerName.toLowerCase().startsWith(search.toLowerCase()) ||
            task.issue.toLowerCase().startsWith(search.toLowerCase()) ||
            task.deviceId.toLowerCase().startsWith(search.toLowerCase()) ||
            task.deviceDetails.toLowerCase().startsWith(search.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}