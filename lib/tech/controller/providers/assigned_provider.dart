// import 'package:flutter/material.dart';
// import 'package:mobile_servies/tech/model/assigned_model.dart';
// import 'package:mobile_servies/tech/service/assigned_service.dart';
// import 'package:mobile_servies/user/UserServices/user_authService.dart';

// class AssignedTechProvider with ChangeNotifier {
//   final AssignedTaskService taskService = AssignedTaskService();
//   final UserAuthService authService = UserAuthService();

//   List<AssignedModel> assignedTasks = [];
//   int selectedIndex = -1;
//   bool isLoading = false;
//   String? errorMessage;
//   Map<String, int> taskCounts = {
//     'Assigned': 0,
//     'InProgress': 0,
//     'Completed': 0,
//   };

//   final Map<String, bool> isAccepting = {};
//   final Map<String, bool> isRejecting = {};

//   Future<void> initialize() async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final technicianId = await authService.getTechnicianId();
//       if (technicianId != null) {
//         await Future.wait([
//           fetchTasks(technicianId),
//           fetchTaskCounts(technicianId),
//         ]);
//       } else {
//         errorMessage = 'No technician ID found. Please log in again.';
//         assignedTasks = [];
//         taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
//       }
//     } catch (e) {
//       errorMessage = 'Failed to initialize data: $e';
//       assignedTasks = [];
//       taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> fetchTasks(String technicianId, {String? searchString}) async {
//     try {
//       assignedTasks = await taskService.fetchAssignedTasks(
//         technicianId: technicianId,
//         status: 'Assigned',
//         searchString: searchString,
//       );
//       isAccepting.removeWhere((key, _) => !assignedTasks.any((task) => task.bookingId == key));
//       isRejecting.removeWhere((key, _) => !assignedTasks.any((task) => task.bookingId == key));
//     } catch (e) {
//       errorMessage = 'Failed to fetch tasks: $e';
//       assignedTasks = [];
//       throw Exception('Failed to fetch tasks: $e');
//     }
//   }

//   Future<void> fetchTaskCounts(String technicianId) async {
//     try {
//       taskCounts = await taskService.fetchTaskCounts(technicianId);
//     } catch (e) {
//       errorMessage = 'Failed to fetch task counts: $e';
//       taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
//       throw Exception('Failed to fetch task counts: $e');
//     }
//   }

//   void dropContainer(int index) {
//     selectedIndex = selectedIndex == index ? -1 : index;
//     notifyListeners();
//   }

//   Future<bool> acceptTask(String bookingId) async {
//     try {
//       final technicianId = await authService.getTechnicianId();
//       if (technicianId == null) {
//         errorMessage = 'No technician ID found. Please log in again.';
//         notifyListeners();
//         return false;
//       }

//       if (bookingId.isEmpty || !isValidGuid(bookingId)) {
//         errorMessage = 'Invalid booking ID';
//         notifyListeners();
//         return false;
//       }

//       isAccepting[bookingId] = true;
//       notifyListeners();

//       final success = await taskService.acceptTask(
//         technicianId: technicianId,
//         bookingId: bookingId,
//       );

//       if (success) {
//         await Future.wait([
//           fetchTasks(technicianId),
//           fetchTaskCounts(technicianId),
//         ]);
//         errorMessage = null; // Clear any previous error message
//       } else {
//         errorMessage = 'Failed to accept task';
//       }

//       isAccepting[bookingId] = false;
//       notifyListeners();
//       return success;
//     } catch (e) {
//       errorMessage = 'Error accepting task: $e';
//       isAccepting[bookingId] = false;
//       notifyListeners();
//       return false;
//     }
//   }

//   Future<bool> rejectTask(String bookingId, String rejectionReason) async {
//     try {
//       final technicianId = await authService.getTechnicianId();
//       if (technicianId == null) {
//         errorMessage = 'No technician ID found. Please log in again.';
//         notifyListeners();
//         return false;
//       }

//       if (bookingId.isEmpty || !isValidGuid(bookingId)) {
//         errorMessage = 'Invalid booking ID';
//         notifyListeners();
//         return false;
//       }

//       isRejecting[bookingId] = true;
//       notifyListeners();

//       final success = await taskService.rejectTask(
//         technicianId: technicianId,
//         bookingId: bookingId,
//         rejectionReason: rejectionReason,
//       );

//       if (success) {
//         await Future.wait([
//           fetchTasks(technicianId),
//           fetchTaskCounts(technicianId),
//         ]);
//         errorMessage = null; // Clear any previous error message
//       } else {
//         errorMessage = 'Failed to reject task';
//       }

//       isRejecting[bookingId] = false;
//       notifyListeners();
//       return success;
//     } catch (e) {
//       errorMessage = 'Error rejecting task: $e';
//       isRejecting[bookingId] = false;
//       notifyListeners();
//       return false;
//     }
//   }

//   Future<void> fetchTasksWithSearch(String? searchString) async {
//     isLoading = true;
//     errorMessage = null;
//     notifyListeners();

//     try {
//       final technicianId = await authService.getTechnicianId();
//       if (technicianId != null) {
//         await fetchTasks(technicianId, searchString: searchString);
//       } else {
//         errorMessage = 'No technician ID found. Please log in again.';
//         assignedTasks = [];
//       }
//     } catch (e) {
//       errorMessage = 'Failed to search tasks: $e';
//       assignedTasks = [];
//     } finally {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   bool isValidGuid(String value) {
//     final guidRegex = RegExp(
//       r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
//     );
//     return guidRegex.hasMatch(value);
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/assigned_model.dart';
import 'package:mobile_servies/tech/service/assigned_service.dart';
import 'package:mobile_servies/user/UserServices/user_authService.dart';

class AssignedTechProvider with ChangeNotifier {
  final AssignedTaskService taskService = AssignedTaskService();
  final UserAuthService authService = UserAuthService();

  List<AssignedModel> assignedTasks = [];
  int selectedIndex = -1;
  bool isLoading = false;
  String? errorMessage;
  Map<String, int> taskCounts = {
    'Assigned': 0,
    'InProgress': 0,
    'Completed': 0,
  };

  final Map<String, bool> isAccepting = {};
  final Map<String, bool> isRejecting = {};

  Future<void> initialize() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await Future.wait([
          fetchTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        assignedTasks = [];
        taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
      }
    } catch (e) {
      errorMessage = 'Failed to initialize data: $e';
      assignedTasks = [];
      taskCounts = {'Assigned': 0, 'InProgress': 0, 'Completed': 0};
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTasks(String technicianId, {String? searchString}) async {
    try {
      assignedTasks = await taskService.fetchAssignedTasks(
        technicianId: technicianId,
        status: 'Assigned',
        searchString: searchString,
      );
      isAccepting.removeWhere((key, _) => !assignedTasks.any((task) => task.bookingId == key));
      isRejecting.removeWhere((key, _) => !assignedTasks.any((task) => task.bookingId == key));
    } catch (e) {
      errorMessage = 'Failed to fetch tasks: $e';
      assignedTasks = [];
      throw Exception('Failed to fetch tasks: $e');
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

  Future<bool> acceptTask(String bookingId) async {
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

      isAccepting[bookingId] = true;
      notifyListeners();

      final success = await taskService.acceptTask(
        technicianId: technicianId,
        bookingId: bookingId,
      );

      if (success) {
        await Future.wait([
          fetchTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
        errorMessage = null;
      } else {
        errorMessage = 'Failed to accept task';
      }

      isAccepting[bookingId] = false;
      notifyListeners();
      return success;
    } catch (e) {
      errorMessage = 'Error accepting task: $e';
      isAccepting[bookingId] = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> rejectTask(String bookingId, String rejectionReason) async {
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

      isRejecting[bookingId] = true;
      notifyListeners();

      final success = await taskService.rejectTask(
        technicianId: technicianId,
        bookingId: bookingId,
        rejectionReason: rejectionReason,
      );

      if (success) {
        await Future.wait([
          fetchTasks(technicianId),
          fetchTaskCounts(technicianId),
        ]);
        errorMessage = null;
      } else {
        errorMessage = 'Failed to reject task';
      }

      isRejecting[bookingId] = false;
      notifyListeners();
      return success;
    } catch (e) {
      errorMessage = 'Error rejecting task: $e';
      isRejecting[bookingId] = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> fetchTasksWithSearch(String? searchString) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final technicianId = await authService.getTechnicianId();
      if (technicianId != null) {
        await fetchTasks(technicianId, searchString: searchString);
      } else {
        errorMessage = 'No technician ID found. Please log in again.';
        assignedTasks = [];
      }
    } catch (e) {
      errorMessage = 'Failed to search tasks: $e';
      assignedTasks = [];
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