import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/admin/Model/tech_reqst_admin_model.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianRequestService {
  final Dio _dio = Dio();
  final String getRequestsUrl = '${ApiConstants.baseURL}/api/Technician/get-requests';
  final String updateRequestStatusUrl = '${ApiConstants.baseURL}/api/Technician/update-request-status';

  TechnicianRequestService() {
    _dio.options.validateStatus = (status) {
      return status != null && (status >= 200 && status < 300) || status == 404;
    };
  }

  bool _isValidUuid(String id) {
    if (id.isEmpty) return false;
    final uuidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$',
    );
    return uuidRegex.hasMatch(id);
  }

  Future<List<TechnicianRequest>> fetchTechnicianRequests({
    String? status,
    String? search,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString('auth_token');
      log('Retrieved token for fetching requests: $token');

      if (token == null || token.isEmpty) {
        log('No auth token found');
        throw Exception('Authentication token is missing or invalid');
      }

      _dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final queryParameters = <String, dynamic>{};
      if (status != null && status.isNotEmpty && status != 'All') {
        queryParameters['status'] = status;
      }
      if (search != null && search.isNotEmpty) {
        queryParameters['search'] = search;
      }

      log('Fetching technician requests from $getRequestsUrl with query: $queryParameters');
      final response = await _dio.get(
        getRequestsUrl,
        queryParameters: queryParameters,
      );

      log('Fetch requests response status: ${response.statusCode}');
      log('Fetch requests response data: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((json) => TechnicianRequest.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
        log('No requests found for the given criteria');
        return [];
      } else {
        throw Exception('Failed to fetch technician requests: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      log('Dio error during fetch requests: ${e.message}');
      log('Dio response data: ${e.response?.data}');
      log('Dio status code: ${e.response?.statusCode}');
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication failed: Invalid or expired token. Please log in again.');
      } else if (e.response?.statusCode == 404) {
        log('No requests found for the given criteria');
        return [];
      }
      throw Exception(
        e.response?.data['message'] ?? 'Failed to fetch technician requests: ${e.message}',
      );
    } catch (e) {
      log('Unexpected error during fetch requests: $e');
      throw Exception('Failed to fetch technician requests: $e');
    }
  }

  Future<bool> updateRequestStatus({
    required String technicianRequestId,
    required bool status,
    String? adminRemarks,
  }) async {
    try {
      if (!_isValidUuid(technicianRequestId)) {
        log('Invalid technicianRequestId: $technicianRequestId');
        throw Exception('Invalid or missing technician request ID');
      }

      final prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString('auth_token');
      log('Retrieved token for updating request status: $token');

      if (token == null || token.isEmpty) {
        log('No auth token found');
        throw Exception('Authentication token is missing or invalid');
      }

      _dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };

      final data = {
        'technicianRequestId': technicianRequestId,
        'status': status,
        'adminRemarks': adminRemarks ?? '',
      };

      log('Updating request status with data: $data');
      final response = await _dio.patch(
        updateRequestStatusUrl,
        data: data,
      );

      log('Update request status response status: ${response.statusCode}');
      log('Update request status response data: ${response.data}');

      return response.statusCode == 200;
    } on DioException catch (e) {
      log('Dio error during update request status: ${e.message}');
      log('Dio response data: ${e.response?.data}');
      log('Dio status code: ${e.response?.statusCode}');
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication failed: Invalid or expired token. Please log in again.');
      }
      final errors = e.response?.data['errors'] as Map<String, dynamic>?;
      if (errors != null) {
        final errorMessages = errors.entries
            .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
            .join('; ');
        throw Exception('Validation errors: $errorMessages');
      }
      throw Exception(
        e.response?.data['message'] ?? 'Failed to update request status: ${e.message}',
      );
    } catch (e) {
      log('Unexpected error during update request status: $e');
      throw Exception('Failed to update request status: $e');
    }
  }
}