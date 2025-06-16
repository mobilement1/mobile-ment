import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/deviceBookingModel.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/serviceBookingModel.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';

class DeviceServiceProvider with ChangeNotifier {
  final Dio dio = Dio();

  List<DeviceBookingModel> devices = [];
  List<ServiceBookingModel> services = [];
  bool isLoading = false;
  String?selectedDeviceId;
   String? selectedDevice;
   String?selectedServiceId;
  String? selectedService;


  Future<void> fetchDevices() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dio.get(ApiConstants.devicebooking);
      log('Service response data: ${response.data}');
      devices = (response.data['data'] as List)
          .map((json) => DeviceBookingModel.fromJson(json))
          .toList();
    } catch (e) {
      log('Device fetch error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchServices() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dio.get(ApiConstants.serviceBooking);
      services = (response.data['data'] as List)
          .map((json) => ServiceBookingModel.fromJson(json))
          .toList();
    } catch (e) {
      log('Service fetch error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void> fetchAllBookingData() async {
    isLoading = true;
    notifyListeners();
    await Future.wait([
      fetchDevices(),
      fetchServices(),
    ]);
    isLoading = false;
    notifyListeners();
  }

  void setSelectedDevice(String? device,String?id) {
    selectedDeviceId=id;
    selectedDevice = device?.trim();
    notifyListeners();
  }

  void setSelectedService(String? service,String?id) {
    selectedServiceId=id;
    selectedService = service?.trim();
    notifyListeners();
  }

  
}
