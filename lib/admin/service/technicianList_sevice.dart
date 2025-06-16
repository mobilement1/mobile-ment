import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/admin/Model/technicianList_model.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianListService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseURL, 
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  Future<List<TechnicianListModel>> getTechnicians({String? technicianId, String? search}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString('auth_token');

      if (token == null || token.isEmpty) {
        log("No token available");
        throw Exception('Authentication token is missing or invalid');
      }
log('Token being used: $token');
log('Full headers: ${_dio.options.headers}');

      _dio.options.headers['Authorization'] = 'Bearer $token'; 
      log('Fetching technicians from ${ApiConstants.baseURL}/api/Technician/get-technicians with query: {technicianId: $technicianId, search: $search}');

      final response = await _dio.get(
        '/api/Technician/get-technicians',
        queryParameters: {
          if (technicianId != null && technicianId.isNotEmpty) 'technicianId': technicianId,
          if (search != null && search.isNotEmpty) 'search': search,
        },
      );

      log('Fetch technicians response status: ${response.statusCode}');
      log('Fetch technicians response data: ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data;
        List<dynamic> technicianList;
        if (data is List) {
          technicianList = data;
        } else if (data is Map<String, dynamic> && data.containsKey('data')) {
          technicianList = data['data'] ?? [];
        } else {
          throw Exception('Unexpected response format: $data');
        }
        return technicianList.map((json) => TechnicianListModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load technicians: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      log('Dio error during fetch technicians: ${e.message}');
      log('Dio response data: ${e.response?.data}');
      log('Dio status code: ${e.response?.statusCode}');
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication failed: Invalid or expired token. Please log in again.');
      }
      if (e.response?.statusCode == 404) {
        throw Exception('Endpoint not found. Please check the API URL or server configuration.');
      }
      throw Exception(
        e.response?.data['message'] ?? 'Failed to load technicians: ${e.message}',
      );
    } catch (e) {
      log('Unexpected error during fetch technicians: $e');
      throw Exception('Failed to load technicians: $e');
    }
  }
}