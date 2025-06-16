import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/inProgress_model.dart';
import 'package:mobile_servies/tech/service/inProgress_service.dart';
import 'package:mobile_servies/user/UserServices/user_authService.dart';

class InProgressTechProvider with ChangeNotifier {
  final InProgressTaskService taskService = InProgressTaskService();
  final UserAuthService authService = UserAuthService();

  List<InProgressModel> inProgressTasks = [];
  int selectedIndex = -1;
  bool isLoading = false;
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
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await Future.wait([
          fetchInProgressTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        inProgressTasks = [];
        taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      }
    } catch (e) {
      errorMessage = 'Failed to initialize data: $e';
      inProgressTasks = [];
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchInProgressTasks(String technicianId, {String? searchString}) async {
    try {
      inProgressTasks = await taskService.fetchInProgressTasks(
        technicianId: technicianId,
        status: 'InProgress',
        searchString: searchString,
      );
      isCompleting.removeWhere((key, _) => !inProgressTasks.any((task) => task.bookingId == key));
      isReassigning.removeWhere((key, _) => !inProgressTasks.any((task) => task.bookingId == key));
    } catch (e) {
      errorMessage = 'Failed to fetch in-progress tasks: $e';
      inProgressTasks = [];
      throw Exception('Failed to fetch in-progress tasks: $e');
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

  Future<void> fetchInProgressTasksWithSearch(String? searchString) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await fetchInProgressTasks(technicianId, searchString: searchString);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        inProgressTasks = [];
      }
    } catch (e) {
      errorMessage = 'Failed to search in-progress tasks: $e';
      inProgressTasks = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  bool isValidGuid(String value) {
    final guidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
    );
    return guidRegex.hasMatch(value);
  }
}