import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/model/profile_model.dart';
import 'package:mobile_servies/tech/service/profile_service.dart';
import 'dart:developer';


class UserProfileProvider with ChangeNotifier {
  final UserProfileService _profileService = UserProfileService();
  
  UserProfileModel? _userProfile;
  bool _isLoading = false;
  String? _errorMessage;

  UserProfileModel? get userProfile => _userProfile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUserProfile() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _userProfile = await _profileService.fetchUserProfile();
      log('ℹ User profile fetched: ${_userProfile!.name}, ${_userProfile!.role}');
    } catch (e) {
      _errorMessage = e.toString();
      _userProfile = null;
      log('❌ Error fetching user profile: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  void clearProfileData() {
  _userProfile = null;
  _isLoading = false;
  _errorMessage = null;
  notifyListeners();
}


}