import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/tech/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianProfileService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://mobilemend-backend.onrender.com'));

  Future<TechnicianProfile> getTechnicianProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token == null || token.isEmpty) throw Exception('Token missing');

      _dio.options.headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await _dio.get('/api/Auth/me');
      log('[LOG] Technician profile: ${response.data}');

      return TechnicianProfile.fromJson(response.data);
    } on DioException catch (e) {
      log('[ERROR] Dio: ${e.message}');
      throw Exception('Error fetching profile: ${e.message}');
    } catch (e) {
      log('[ERROR] General: $e');
      throw Exception('Error fetching profile: $e');
    }
  }
}
