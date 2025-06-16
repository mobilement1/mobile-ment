import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/admin/Model/bookingmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';

class BookingService {
  final Dio _dio;

  BookingService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseURL,
            // connectTimeout: const Duration(seconds: 30),
            // receiveTimeout: const Duration(seconds: 30),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  Future<String?> _getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      log('Auth token: ${token != null ? 'Found' : 'Not found'}');
      return token;
    } catch (e) {
      log('Error getting auth token: $e');
      return null;
    }
  }

  Future<List<Booking>> getBookings({
    String? bookingId,
    String? status,
    String? technicianId,
    String? searchString,
  }) async {
    try {
      log('Fetching bookings: bookingId=$bookingId, status=$status, technicianId=$technicianId, searchString=$searchString');
      final authToken = await _getAuthToken();
      if (authToken == null) {
        throw Exception('Authentication token not found. Please log in.');
      }

      final response = await _dio.get(
        '/api/Booking/get-booking',
        queryParameters: {
          if (bookingId != null && bookingId.isNotEmpty) 'bookingId': bookingId,
          if (status != null && status.isNotEmpty && status != 'All') 'status': status,
          if (technicianId != null && technicianId.isNotEmpty)
            'technicianId': technicianId,
          if (searchString != null && searchString.isNotEmpty)
            'searchString': searchString,
        },
        options: Options(
          headers: {'Authorization': 'Bearer $authToken'},
        ),
      );

      log('Response status: ${response.statusCode}, data: ${response.data}');
      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;
        final List<dynamic> data = responseData['data'] as List<dynamic>? ?? [];
        log('Parsed ${data.length} bookings');
        return data
            .map((json) => Booking.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        log('Unexpected status code: ${response.statusCode}, message: ${response.statusMessage}');
        throw Exception(
            'Failed to load bookings: ${response.statusMessage ?? 'Unknown error'}');
      }
    } on DioException catch (e) {
      log('DioException: ${e.message}, status: ${e.response?.statusCode}, data: ${e.response?.data}',
          stackTrace: e.stackTrace);
      if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized: Please log in again.');
      }
      throw Exception('Network error: ${e.message}');
    } catch (e, stackTrace) {
      log('Error in getBookings: $e', stackTrace: stackTrace);
      throw Exception('Failed to load bookings: $e');
    }
  }
} 