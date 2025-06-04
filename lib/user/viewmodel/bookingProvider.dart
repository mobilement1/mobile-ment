import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/service/bookingservice.dart';


class BookingProvider with ChangeNotifier {
  final BookingService _bookingService = BookingService();

  List<dynamic> services = [];
  bool isLoading = false;
  String? error;

  

  Future<void>fetchBookingService() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      services = await _bookingService.fetchBookings();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  
  
}
