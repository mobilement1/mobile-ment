import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/tech/model/profile_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserProfileService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://mobilemend-backend.onrender.com',
  ));

  Future<String?> _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    log('ℹ Retrieved token: ${token != null ? 'present' : 'null'}');
    return token;
  }

  Future<UserProfileModel> fetchUserProfile() async {
    final token = await _getAuthToken();
    if (token == null) throw Exception('Not authenticated');

    try {
      log('ℹ Fetching user profile');
      final response = await _dio.get(
        '/api/Auth/me',  // Make sure this is the correct endpoint
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      log('ℹ API Response: ${response.data.toString()}');
      log('ℹ Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        if (response.data is Map) {
          // Check if the data is nested under 'data' key or at root
          final data = response.data['data'] ?? response.data;
          if (data is Map<String, dynamic>) {
            log('ℹ User profile data parsed successfully');
            return UserProfileModel.fromJson(data);
          } else {
            log('⚠ Unexpected data format: Expected Map, got ${data.runtimeType}');
            throw Exception('Unexpected data format');
          }
        } else {
          log('⚠ Unexpected response format: Expected Map, got ${response.data.runtimeType}');
          throw Exception('Unexpected response format');
        }
      }
      throw Exception('Failed to load user profile: Status ${response.statusCode}');
    } on DioException catch (e) {
      log('❌ Error fetching user profile: ${e.response?.data ?? e.message}, Status: ${e.response?.statusCode}');
      throw Exception('Failed to load user profile: ${e.response?.data['error'] ?? e.message}');
    }
  }

  

  
}