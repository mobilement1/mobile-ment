import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/tech/model/assigned_model.dart';
import 'package:mobile_servies/user/UserServices/user_authService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignedTaskService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://mobilemend-backend.onrender.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
  ));
  final UserAuthService _authService = UserAuthService();

  Future<String?> _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    log('ℹ️ Retrieved token: ${token != null ? 'present' : 'null'}');
    return token;
  }

  Future<List<AssignedModel>> fetchAssignedTasks({
    required String technicianId,
    String status = 'Assigned',
    String? searchString,
  }) async {
    final token = await _getAuthToken();
    if (token == null) throw Exception('Not authenticated');

    try {
      log('ℹ️ Fetching tasks with technicianId: $technicianId, status: $status');
      final response = await _dio.get(
        '/api/Booking/get-booking',
        queryParameters: {
          'status': status,
          'technicianId': technicianId,
          if (searchString != null) 'searchString': searchString,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      log('ℹ️ API Response: ${response.data}');
      log('ℹ️ Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        if (response.data is Map && response.data['data'] is List) {
          final data = response.data['data'] as List;
          log('ℹ️ Parsed ${data.length} tasks from response');
          if (data.isEmpty) {
            log('ℹ️ No tasks returned for technicianId: $technicianId, status: $status');
            return [];
          }
          return data.map((json) => AssignedModel.fromJson(json)).toList();
        } else if (response.data is List) {
          final data = response.data as List;
          log('ℹ️ Parsed ${data.length} tasks from direct list response');
          if (data.isEmpty) {
            log('ℹ️ No tasks returned for technicianId: $technicianId, status: $status');
            return [];
          }
          return data.map((json) => AssignedModel.fromJson(json)).toList();
        } else {
          log('⚠️ Unexpected response format: Expected Map with "data" or List, got ${response.data.runtimeType}');
          throw Exception('Unexpected response format');
        }
      }
      throw Exception('Failed to load tasks: Status ${response.statusCode}');
    } on DioException catch (e) {
      log('❌ Error fetching tasks: ${e.response?.data ?? e.message}, Status: ${e.response?.statusCode}');
      throw Exception(
          'Failed to load tasks: ${e.response?.data['errors'] ?? e.message}');
    }
  }

  Future<Map<String, int>> fetchTaskCounts(String technicianId) async {
    final token = await _getAuthToken();
    if (token == null) throw Exception('Not authenticated');

    final counts = <String, int>{
      'Assigned': 0,
      'InProgress': 0,
      'Completed': 0
    };
    final statuses = ['Assigned', 'InProgress', 'Completed'];

    try {
      for (final status in statuses) {
        log('ℹ️ Fetching task count for status: $status, technicianId: $technicianId');
        final response = await _dio.get(
          '/api/Booking/get-booking',
          queryParameters: {
            'status': status,
            'technicianId': technicianId,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),
        );

        log('ℹ️ Task Count Response for $status: ${response.data}');

        if (response.statusCode == 200) {
          if (response.data is Map && response.data['data'] is List) {
            counts[status] = (response.data['data'] as List).length;
          } else if (response.data is List) {
            counts[status] = (response.data as List).length;
          } else {
            log('⚠️ Invalid response for $status: ${response.data.runtimeType}');
            counts[status] = 0;
          }
        } else {
          log('⚠️ Non-200 status for $status: ${response.statusCode}');
          counts[status] = 0;
        }
      }
      log('ℹ️ Task counts: $counts');
      return counts;
    } on DioException catch (e) {
      log('❌ Error fetching counts: ${e.response?.data ?? e.message}, Status: ${e.response?.statusCode}');
      throw Exception(
          'Failed to load counts: ${e.response?.data['errors'] ?? e.message}');
    }
  }

  Future<bool> acceptTask({
    required String technicianId,
    required String bookingId,
  }) async {
    final token = await _getAuthToken();
    if (token == null) throw Exception('Not authenticated');

    if (bookingId.isEmpty || !_isValidGuid(bookingId)) {
      log('❌ Invalid bookingId: $bookingId');
      throw Exception('Invalid bookingId: Must be a valid GUID');
    }

    try {
      log('ℹ️ Accepting task with technicianId: $technicianId, bookingId: $bookingId');
      final response = await _dio.patch(
        '/api/Technician/update-service-status',
        data: {
          'technicianId': technicianId,
          'bookingId': bookingId,
          'status': 'Accepted',
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      log('ℹ️ Accept Task Response: ${response.data}, Status: ${response.statusCode}');
      return response.statusCode == 200;
    } on DioException catch (e) {
      log('❌ Error accepting task: ${e.response?.data ?? e.message}, Status: ${e.response?.statusCode}');
      throw Exception(
          'Failed to accept task: ${e.response?.data['errors'] ?? e.message}');
    }
  }

  Future<bool> rejectTask({
    required String technicianId,
    required String bookingId,
    required String rejectionReason,
  }) async {
    final token = await _getAuthToken();
    if (token == null) throw Exception('Not authenticated');

    if (bookingId.isEmpty || !_isValidGuid(bookingId)) {
      log('❌ Invalid bookingId: $bookingId');
      throw Exception('Invalid bookingId: Must be a valid GUID');
    }

    try {
      log('ℹ️ Rejecting task with technicianId: $technicianId, bookingId: $bookingId, reason: $rejectionReason');
      final response = await _dio.patch(
        '/api/Technician/update-service-request',
        data: {
          'technicianId': technicianId,
          'bookingId': bookingId,
          'status': false,
          'rejectionReason': rejectionReason,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      log('ℹ️ Reject Task Response: ${response.data}, Status: ${response.statusCode}');
      if (response.statusCode == 200) {
        // Verify the task status by fetching the updated task
        final tasks = await fetchAssignedTasks(
          technicianId: technicianId,
          status: 'Rejected',
          searchString: bookingId,
        );
        final taskRejected = tasks.any((task) => task.bookingId == bookingId && task.status == 'Rejected');
        if (taskRejected) {
          log('ℹ️ Task rejection confirmed via follow-up fetch');
          return true;
        } else {
          log('⚠️ Task rejection not reflected in server state');
          return false;
        }
      }
      return false;
    } on DioException catch (e) {
      log('❌ Error rejecting task: ${e.response?.data ?? e.message}, Status: ${e.response?.statusCode}');
      if (e.response?.statusCode == 500) {
        // Even if a 500 error occurs, check if the task was actually rejected
        try {
          final tasks = await fetchAssignedTasks(
            technicianId: technicianId,
            status: 'Rejected',
            searchString: bookingId,
          );
          final taskRejected = tasks.any((task) => task.bookingId == bookingId && task.status == 'Rejected');
          if (taskRejected) {
            log('ℹ️ Task rejection confirmed via follow-up fetch despite 500 error');
            return true;
          }
        } catch (verifyError) {
          log('❌ Error verifying rejection: $verifyError');
        }
        throw Exception('Server error: Unable to process the rejection. Please try again later or contact support.');
      }
      throw Exception(
          'Failed to reject task: ${e.response?.data['errors'] ?? e.message}');
    }
  }

  bool _isValidGuid(String value) {
    final guidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
    );
    return guidRegex.hasMatch(value);
  }
}