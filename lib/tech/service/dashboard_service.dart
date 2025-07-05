import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/tech/model/dashboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardService {
  Future<DashboardModelData> fetchDashboardData() async {
    log('🔄 Fetching dashboard data...');

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      log('ℹ Retrieved token: ${token != null ? 'present' : 'null'}');

      if (token == null || token.isEmpty) {
        log('⚠ Token is missing');
        throw Exception('Authentication token is missing');
      }

      final dio = Dio(BaseOptions(
        baseUrl: 'https://mobilemend-backend.onrender.com',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));

      final response = await dio.get(
        '/api/Technician/dashboard-data',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      log('✅ Response received: ${response.statusCode}');
      if (response.statusCode == 200) {
        log('📦 Raw Data: ${response.data}');
        final dashboardData = DashboardModelData.fromJson(response.data);
        log('📦 Parsed Data: ${dashboardData.toJson()}');
        return dashboardData;
      } else {
        log('⚠ Failed with status: ${response.statusCode}');
        throw Exception('Failed to load dashboard data: ${response.statusMessage ?? response.statusCode}');
      }
    } catch (e) {
      log('❌ Error occurred: $e');
      throw Exception('Error fetching dashboard data: $e');
    }
  }
}