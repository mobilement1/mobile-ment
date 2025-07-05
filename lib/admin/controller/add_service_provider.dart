import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/add_service_model.dart';
import 'package:mobile_servies/admin/service/add_service_service.dart';

class ServiceProvider extends ChangeNotifier {
  final ServiceApi _serviceApi = ServiceApi();
  List<Service> _services = [];
  List<Service> _searchServicesList = [];
  List<Service> _searchedList = [];
  bool _isLoading = false;
  String? _error;

  List<Service> get services => _services;
  List<Service> get searchedList => _searchedList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchServices() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _services = await _serviceApi.fetchServices();
      _searchServicesList = List.from(_services);
      _searchedList = List.from(_services);
    } catch (e) {
      _error = e.toString();
      _services = [];
      _searchServicesList = [];
      _searchedList = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

   Future<void> refreshServices() async {
    await fetchServices();
  }

  Future<bool> addService(Service service) async {
    try {
      final success = await _serviceApi.addService(service);
      if (success) {
        await fetchServices();
      }
      return success;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateService(Service service) async {
    try {
      final success = await _serviceApi.updateService(service);
      if (success) {
        await fetchServices();
      }
      return success;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteService(String serviceId) async {
    try {
      final success = await _serviceApi.deleteService(serviceId);
      if (success) {
        await fetchServices();
      }
      return success;
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> searchFn(String search) async {
    if (search.isEmpty) {
      _searchedList = List.from(_searchServicesList);
    } else {
      _searchedList = _searchServicesList.where((service) {
        return service.serviceName.toLowerCase().startsWith(search.toLowerCase()) ||
            service.category.toLowerCase().startsWith(search.toLowerCase()) ||
            service.description.toLowerCase().startsWith(search.toLowerCase()) ||
            service.estimatedTime.toString().toLowerCase().startsWith(search.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}