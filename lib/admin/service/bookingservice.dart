import 'package:dio/dio.dart';
import 'package:mobile_servies/admin/Model/bookingmodel.dart';

class BookingService {
  final Dio _dio = Dio();

  Future<List<Booking>> fetchBookings() async {
    try {
      final response = await _dio.get(
          'https://mobilemend-backend.onrender.com/api/Booking/get-booking');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Booking.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load bookings: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Dio error: $e');
    }
  }
}
