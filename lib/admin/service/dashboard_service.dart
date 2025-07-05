// lib/admin/service/dashboard_service.dart

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/admin/Model/dashboard_model.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardService {
  final Dio _dio;

  DashboardService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseURL,
            headers: {'Content-Type': 'application/json'},
            validateStatus: (status) => status! < 500,
          ),
        );

  Future<String?> _getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      log('[DashboardService] Retrieved auth token: $token');
      return token;
    } catch (e) {
      log('[DashboardService] Error retrieving auth token: $e');
      return null;
    }
  }

  Future<AdminDashboardMetrics> getDashboardData() async {
    log('[DashboardService] Fetching dashboard data...');
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Authentication token not found');

      final response = await _dio.get(
        '/api/Admin/dashboard-data',
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[DashboardService] Response status: ${response.statusCode}');
      log('[DashboardService] Response data: ${response.data}');

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch dashboard data: ${response.data}');
      }

      return AdminDashboardMetrics.fromJson(response.data);
    } on DioException catch (e) {
      log('[DashboardService] DioException: ${e.message}');
      throw Exception('Error fetching dashboard data: ${e.message}');
    } catch (e) {
      log('[DashboardService] General Error: $e');
      throw Exception('Error: $e');
    }
  }
}