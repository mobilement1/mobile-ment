import 'package:flutter/material.dart';
import 'package:mobile_servies/user/UserModel/ServiceModel/userServiceModel.dart';

import 'package:mobile_servies/user/UserServices/UserserviceService/userserviceService.dart';

class UserServiceProvider extends ChangeNotifier {
  final UserServiceService service = UserServiceService();

  List<Userservicemodel> services = [];
  List<Userservicemodel> filteredServices = [];
  bool isLoading = false;

  Future<void> fetchServices() async {
    isLoading = true;
    notifyListeners();

    final result = await service.fetchAllServices();
    services = result;
    filteredServices = result; // Initially show all
    isLoading = false;
    notifyListeners();
  }

  void filterServices(String query) {
    if (query.isEmpty) {
      filteredServices = services;
    } else {
      filteredServices = services
          .where((service) =>
              service.serviceName.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
