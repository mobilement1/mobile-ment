import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/profile_model.dart';
import 'package:mobile_servies/tech/service/profile_service.dart';
class TechnicianProfileProvider with ChangeNotifier {
  final _service = TechnicianProfileService();

  TechnicianProfile? _profile;
  TechnicianProfile? get profile => _profile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadProfile() async {
    _isLoading = true;
    notifyListeners();
    try {
      _profile = await _service.getTechnicianProfile();
    } catch (e) {
      print('Error loading profile: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
