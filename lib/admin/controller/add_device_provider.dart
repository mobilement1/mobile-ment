import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/add_device_model.dart';
import 'package:mobile_servies/admin/service/add_device_service.dart';
import 'package:uuid/uuid.dart';

class DeviceProvider with ChangeNotifier {
  final DeviceService deviceService = DeviceService();
  List<Device> devices = [];
  List<Device> searchDevicesList = [];
  List<Device> searchedList = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchDevices() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      devices = await deviceService.getDevices();
      searchDevicesList = List.from(devices);
      searchedList = List.from(devices);
    } catch (e) {
      error = e.toString();
      devices = [];
      searchDevicesList = [];
      searchedList = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

    Future<void> refreshServices() async {
    await fetchDevices();
  }

  Future<void> addDevice({
    required String deviceName,
    required String brand,
    required String deviceType,
    required String model,
    required int releaseYear,
    required String commonIssues,
    required String repairableComponents,
  }) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final device = Device(
        deviceId:  Uuid().v4(),
        deviceName: deviceName,
        brand: brand,
        deviceType: deviceType,
        model: model,
        releaseYear: releaseYear,
        commonIssues: commonIssues,
        repairableComponents: repairableComponents,
      );
      await deviceService.addDevice(device);
      await fetchDevices();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateDevice(Device device) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await deviceService.updateDevice(device);
      await fetchDevices();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteDevice(String deviceId) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await deviceService.deleteDevice(deviceId);
      await fetchDevices();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchFn(String search) async {
    if (search.isEmpty) {
      searchedList = List.from(searchDevicesList);
    } else {
      searchedList = searchDevicesList.where((device) {
        return device.deviceName.toLowerCase().startsWith(search.toLowerCase()) ||
            device.brand.toLowerCase().startsWith(search.toLowerCase()) ||
            device.model.toLowerCase().startsWith(search.toLowerCase());
        
      }).toList();
    }
    notifyListeners();
  }
}