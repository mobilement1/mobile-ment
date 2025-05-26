import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/bookingmodel.dart';
import 'package:mobile_servies/admin/service/bookingservice.dart';

class BookingProvider extends ChangeNotifier {
  final BookingService _bookingService = BookingService();

  List<Booking> _bookings = [];
  List<Booking> get bookings => _bookings;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _filter = 'All';
  String get filter => _filter;

  List<String> filterOptions = ['All', 'Pending', 'Completed', 'Cancelled'];

  // Fetch bookings from API
  Future<void> loadBookings() async {
    _isLoading = true;
    notifyListeners();

    try {
      _bookings = await _bookingService.fetchBookings();
    } catch (e) {
      _bookings = [];
      // Handle error or log
    }

    _isLoading = false;
    notifyListeners();
  }

  // Change filter
  void changeFilter(String newFilter) {
    _filter = newFilter;
    notifyListeners();
  }

  // Get filtered bookings
  List<Booking> get filteredBookings {
    if (_filter == 'All') return _bookings;
    return _bookings
        .where((b) => b.status.toLowerCase() == _filter.toLowerCase())
        .toList();
  }
}
