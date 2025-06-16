import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:location/location.dart';
import 'package:mobile_servies/user/UserModel/techRequestModel.dart';
import 'package:mobile_servies/user/UserServices/techRequestService.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianApplicationProvider with ChangeNotifier {
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController specializationController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  String? resumePath;
  double? longitude;
  double? latitude;
  bool isLoading = false;
  String? errorMessage;

  Future<void> pickResume() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);
        int fileSize = await file.length();

        if (fileSize > 50 * 1024) {
          errorMessage = 'File size must be less than 50KB';
          notifyListeners();
          return;
        }

        resumePath = file.path;
        errorMessage = null;
        notifyListeners();
      }
    } catch (e) {
      errorMessage = 'Failed to pick file: ${e.toString()}';
      notifyListeners();
    }
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        errorMessage = 'Please enable location services in your device settings';
        notifyListeners();
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        errorMessage = 'Location permissions are required to submit your application';
        notifyListeners();
        return;
      }
    }

    try {
      LocationData locationData = await location.getLocation();
      longitude = locationData.longitude;
      latitude = locationData.latitude;
      errorMessage = null;
      notifyListeners();
    } catch (e) {
      errorMessage = 'Failed to get location: ${e.toString()}';
      notifyListeners();
    }
  }

  Future<bool> submitApplication() async {
    if (resumePath == null) {
      errorMessage = 'Please upload your resume';
      notifyListeners();
      return false;
    }

    if (longitude == null || latitude == null) {
      errorMessage = 'Please enable location services';
      notifyListeners();
      return false;
    }

    if (experienceController.text.isEmpty ||
        specializationController.text.isEmpty ||
        placeController.text.isEmpty ||
        bioController.text.isEmpty) {
      errorMessage = 'Please fill all fields';
      notifyListeners();
      return false;
    }

    try {
      isLoading = true;
      notifyListeners();

      TechnicianApplication application = TechnicianApplication(
        experience: int.parse(experienceController.text),
        resumePath: resumePath!,
        specialization: specializationController.text,
        bio: bioController.text,
        place: placeController.text,
        longitude: longitude!,
        latitude: latitude!,
      );

      final success = await TechnicianApplicationService().submitApplication(application);
      isLoading = false;

      if (success) {
        // Check user role via /api/Auth/me to detect immediate approval
        final prefs = await SharedPreferences.getInstance();
        final token = await prefs.getString('auth_token');
        if (token != null) {
          try {
            final dio = Dio();
            dio.options.headers = {'Authorization': 'Bearer $token'};
            final response = await dio.get('${ApiConstants.baseURL}/api/Auth/me');
            if (response.statusCode == 200 && response.data['data']?['role'] == 'Technician') {
              await prefs.setString('user_role', 'Technician');
              errorMessage =
                  'Technician Request Approved!\nYou are now registered as a Technician.\nPlease log in through the Technician Portal to access your dashboard and manage service requests.';
            } else {
              errorMessage = 'Application submitted successfully! Awaiting admin approval.';
            }
          } catch (e) {
            errorMessage = 'Application submitted successfully! Awaiting admin approval.';
          }
        } else {
          errorMessage = 'Application submitted successfully! Awaiting admin approval.';
        }
      } else {
        errorMessage = 'Failed to submit application.';
      }

      notifyListeners();
      return success;
    } catch (e) {
      errorMessage = 'Error submitting application: ${e.toString()}';
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    experienceController.dispose();
    specializationController.dispose();
    placeController.dispose();
    bioController.dispose();
    super.dispose();
  }
}