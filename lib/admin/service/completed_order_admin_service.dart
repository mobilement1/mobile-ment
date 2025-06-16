import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_servies/admin/Model/completedOrder_admin_model.dart';

class CompletedOrderService {
  final Dio dio;
  final String baseURL;

  CompletedOrderService({required this.dio, required this.baseURL});

  Future<String?> _getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    log('Fetched auth token from SharedPreferences: ${token != null ? 'Provided' : 'Not provided'}');
    return token;
  }

  Future<List<CompletedOrder>> getCompletedOrders({
    String? technicianId,
    String? searchString,
  }) async {
    try {
      log('Fetching completed orders...');
      log('Base URL: $baseURL');
      log('Technician ID: $technicianId');
      log('Search String: $searchString');

      final authToken = await _getAuthToken();

      final response = await dio.get(
        '$baseURL/api/Booking/get-booking',
        queryParameters: {
          'status': 'Completed',
          if (technicianId != null) 'technicianId': technicianId,
          if (searchString != null && searchString.isNotEmpty)
            'searchString': searchString,
        },
        options: Options(
          headers: {
            if (authToken != null) 'Authorization': 'Bearer $authToken',
          },
        ),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> data = responseData['data'] ?? [];
        log('Parsed ${data.length} completed orders');
        return data.map((json) => CompletedOrder.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load completed orders. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        log('DioException with status code: ${e.response?.statusCode}');
        log('Response data: ${e.response?.data}');
        if (e.response?.statusCode == 401) {
          throw Exception('Unauthorized: Invalid or missing authentication token');
        }
        throw Exception(
            'Failed to load completed orders. Status code: ${e.response?.statusCode}');
      } else {
        log('DioException without response: ${e.message}');
        throw Exception('Failed to fetch completed orders: ${e.message}');
      }
    } catch (e) {
      log('General Exception: $e');
      throw Exception('Failed to fetch completed orders: $e');
    }
  }
}