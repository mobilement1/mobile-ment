import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_servies/admin/Model/add_service_model.dart'; 

class ServiceApi {
  final Dio _dio;

  ServiceApi()
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
      log('[ServiceApi] Auth token: $token');
      return token;
    } catch (e) {
      log('[ServiceApi] Error getting token: $e');
      return null;
    }
  }

  Future<List<Service>> fetchServices() async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      log('[ServiceApi] Fetching services...');
      final response = await _dio.get(
        '/api/Service/get-service',
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[ServiceApi] Response [GET /get-service] Status: ${response.statusCode}');
      log('[ServiceApi] Raw Response: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data is List) {
          log('[ServiceApi] Response is a List');
          return (response.data as List).map((json) => Service.fromJson(json)).toList();
        } else if (response.data is Map<String, dynamic>) {
          final data = response.data['data'] ?? response.data['services'] ?? [];
          log('[ServiceApi] Extracted data: $data');
          if (data is List) {
            return data.map((json) => Service.fromJson(json)).toList();
          } else {
            throw Exception('[ServiceApi] Expected a list of services, but got ${data.runtimeType}');
          }
        } else {
          throw Exception('[ServiceApi] Unexpected response type: ${response.data.runtimeType}');
        }
      }

      throw Exception('[ServiceApi] Failed to fetch services: ${response.statusCode}');
    } catch (e) {
      log('[ServiceApi] Error fetching services: $e');
      throw Exception('Error fetching services: $e');
    }
  }

  Future<bool> addService(Service service) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      log('[ServiceApi] Adding service: ${service.toJson()}');
      final response = await _dio.post(
        '/api/Service/add-service',
        data: service.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[ServiceApi] Response [POST /add-service] Status: ${response.statusCode}');
      log('[ServiceApi] Response Body: ${response.data}');

      return response.statusCode == 200;
    } catch (e) {
      log('[ServiceApi] Error adding service: $e');
      throw Exception('Error adding service: $e');
    }
  }

  Future<bool> updateService(Service service) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      log('[ServiceApi] Updating service: ${service.toJson()}');
      final response = await _dio.put(
        '/api/Service/update-service',
        data: service.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[ServiceApi] Response [PUT /update-service] Status: ${response.statusCode}');
      log('[ServiceApi] Response Body: ${response.data}');

      return response.statusCode == 200;
    } catch (e) {
      log('[ServiceApi] Error updating service: $e');
      throw Exception('Error updating service: $e');
    }
  }

  Future<bool> deleteService(String serviceId) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      log('[ServiceApi] Deleting service with ID: $serviceId');
      final response = await _dio.delete(
        '/api/Service/delete-service',
        queryParameters: {'serviceId': serviceId},
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[ServiceApi] Response [DELETE /delete-service] Status: ${response.statusCode}');
      log('[ServiceApi] Response Body: ${response.data}');

      return response.statusCode == 200;
    } catch (e) {
      log('[ServiceApi] Error deleting service: $e');
      throw Exception('Error deleting service: $e');
    }
  }
}