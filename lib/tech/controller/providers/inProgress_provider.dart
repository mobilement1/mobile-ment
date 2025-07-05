import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/inProgress_model.dart';
import 'package:mobile_servies/tech/service/inProgress_service.dart';
import 'package:mobile_servies/user/UserServices/AuthService/user_authService.dart';


class InProgressTechProvider with ChangeNotifier {
  final InProgressTaskService taskService = InProgressTaskService();
  final UserAuthService authService = UserAuthService();

  List<InProgressModel> inProgressTasks = [];
  List<InProgressModel> searchInProgressList = [];
  List<InProgressModel> searchedList = [];
  int selectedIndex = -1;
  bool isLoading = false;
    bool isFirstLoad = true;
  String? errorMessage;
  Map<String, int> taskCounts = {
    'Assigned': 0,
    'InProgress': 0,
    'Completed': 0,
  };

  final Map<String, bool> isCompleting = {};
  final Map<String, bool> isReassigning = {};

  Future<void> initialize() async {
    isLoading = true;
     isFirstLoad=true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await Future.wait([
          fetchInProgressTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
        // Initialize search lists
        searchInProgressList = List.from(inProgressTasks);
        searchedList = List.from(inProgressTasks);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        inProgressTasks = [];
        searchInProgressList = [];
        searchedList = [];
        taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      }
    } catch (e) {
      errorMessage = 'Failed to initialize data: $e';
      inProgressTasks = [];
      searchInProgressList = [];
      searchedList = [];
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
    } finally {
      isLoading = false;
       isFirstLoad=false;
      notifyListeners();
    }
  }

   Future<void> refreshInProgress() async {
    await initialize();
  }

  Future<void> fetchInProgressTasks(String technicianId) async {
    try {
      inProgressTasks = await taskService.fetchInProgressTasks(
        technicianId: technicianId,
        status: 'InProgress',
      );
      searchInProgressList = List.from(inProgressTasks);
      searchedList = List.from(inProgressTasks);
      isCompleting.removeWhere((key, _) => !inProgressTasks.any((task) => task.bookingId == key));
      isReassigning.removeWhere((key, _) => !inProgressTasks.any((task) => task.bookingId == key));
    } catch (e) {
      errorMessage = 'Failed to fetch in-progress tasks: $e';
      inProgressTasks = [];
      searchInProgressList = [];
      searchedList = [];
      throw Exception('Failed to fetch in-progress tasks: $e');
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

  Future<bool> completeTask(String bookingId) async {
    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId == null) {
        errorMessage = 'No technician ID found. Please log in again.';
        notifyListeners();
        return false;
      }

      if (bookingId.isEmpty || !isValidGuid(bookingId)) {
        errorMessage = 'Invalid booking ID';
        notifyListeners();
        return false;
      }

      isCompleting[bookingId] = true;
      notifyListeners();

      final success = await taskService.completeTask(
        technicianId: technicianId,
        bookingId: bookingId,
      );

      if (success) {
        await Future.wait([
          fetchInProgressTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
        errorMessage = null;
      } else {
        errorMessage = 'Failed to complete task';
      }

      isCompleting[bookingId] = false;
      notifyListeners();
      return success;
    } catch (e) {
      errorMessage = 'Error completing task: $e';
      isCompleting[bookingId] = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> reassignTask(String bookingId) async {
    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId == null) {
        errorMessage = 'No technician ID found. Please log in again.';
        notifyListeners();
        return false;
      }

      if (bookingId.isEmpty || !isValidGuid(bookingId)) {
        errorMessage = 'Invalid booking ID';
        notifyListeners();
        return false;
      }

      isReassigning[bookingId] = true;
      notifyListeners();

      final success = await taskService.reassignTask(
        technicianId: technicianId,
        bookingId: bookingId,
      );

      if (success) {
        await Future.wait([
          fetchInProgressTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
        errorMessage = null;
      } else {
        errorMessage = 'Failed to reassign task';
      }

      isReassigning[bookingId] = false;
      notifyListeners();
      return success;
    } catch (e) {
      errorMessage = 'Error reassigning task: $e';
      isReassigning[bookingId] = false;
      notifyListeners();
      return false;
    }
  }

  bool isValidGuid(String value) {
    final guidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
    );
    return guidRegex.hasMatch(value);
  }

  Future<void> searchFn(String search) async {
    if (search.isEmpty) {
      searchedList = List.from(searchInProgressList);
    } else {
      searchedList = searchInProgressList.where((task) {
        return task.customerName.toLowerCase().startsWith(search.toLowerCase()) ||
            task.issue.toLowerCase().startsWith(search.toLowerCase()) ||
            task.deviceId.toLowerCase().startsWith(search.toLowerCase()) ||
            task.deviceDetails.toLowerCase().startsWith(search.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}