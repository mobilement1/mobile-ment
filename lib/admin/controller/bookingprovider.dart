import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/bookingmodel.dart';
import 'package:mobile_servies/admin/service/bookingservice.dart';

class BookingProvider with ChangeNotifier {
  final BookingService service;
  List<Booking> bookings = [];
  bool isLoading = false;
  String error = '';
  String selectedFilter = 'All';
  String searchQuery = '';
   List<String> filterOptions = [
    'All',
    'Assigned',
    'InProgress',
    'Accepted',
    'Rejected',
    'Reassigned',
    'Completed',
  ];

  BookingProvider({BookingService? service}) : service = service ?? BookingService();

  Future<void> fetchBookings() async {
    isLoading = true;
    error = '';
    notifyListeners();

    try {
      bookings = await service.getBookings(
        status: selectedFilter == 'All' ? null : selectedFilter,
        searchString: searchQuery.isEmpty ? null : searchQuery,
      );
      if (bookings.isEmpty && searchQuery.isNotEmpty) {
        error = 'No bookings found for search query "$searchQuery"';
      } else if (bookings.isEmpty) {
        error = 'No bookings available';
      }
    } catch (e) {
      error = e.toString();
      bookings = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setFilter(String filter) {
    selectedFilter = filter;
    fetchBookings();
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    fetchBookings();
  }

  void resetFilter() {
    selectedFilter = 'All';
    searchQuery = '';
    fetchBookings();
  }

  void refresh() {
    error = '';
    fetchBookings();
  }
}