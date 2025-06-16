import 'dart:developer';

import 'package:flutter/widgets.dart';

import 'package:mobile_servies/user/UserModel/RepairModel/repairModel.dart';
import 'package:mobile_servies/user/UserServices/RepairServices/repairService.dart';


class BookingProviderUser with ChangeNotifier {
  final BookingServiceUSer service = BookingServiceUSer();

  List<BookingModelUser> bookings = [];
  bool isLoading = false;

  String errorMessage = '';
  String successMessage = '';

  // Selected values from UI
  String? selectedDeviceID;
  String? selectedServiceID;
  String? selectedTechnicianID;
  String? selectedAddressID;
  String issueDescription = '';



  // Fetch all bookings
  Future<void>fetchBookingPro() async {
    isLoading = true;
    errorMessage = "";
    notifyListeners();

    try {
      bookings = await service.fetchBookingSer(); // store the fetched list
    } catch (e) {
      errorMessage = e.toString();
      log("Fetch Booking Error: $errorMessage");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

   // ✅ Fetch best technician suggestions based on location
  Future<List<dynamic>> fetchNearbyTechnicians() async {
    if (selectedAddressID == null || selectedDeviceID == null) {
      log("❌ Address ID or Device ID missing");
      return [];
    }
    final technicians = await service.getBestTechnicians(selectedAddressID!, selectedDeviceID!);
    return technicians;
  }

  // Add new booking
  Future<Map<String,dynamic>> addBookingPro() async {
    try {
      if (selectedDeviceID == null ||
          selectedServiceID == null ||
          selectedAddressID == null||
          issueDescription.isEmpty) {
        errorMessage = "Please fill all required fields";
        notifyListeners();
        return {
          "success":false,
          "message":errorMessage,
        };
      }

log("🔍 Booking Debug Info:");
log("Device ID: ${selectedDeviceID ?? 'Not selected'}");
log("Service ID: ${selectedServiceID ?? 'Not selected'}");
log("Address ID: ${selectedAddressID ?? 'Not selected'}");
log("Technician ID: ${selectedTechnicianID ?? 'Not selected'}");
log("Issue: ${issueDescription.isEmpty ? 'Empty' : issueDescription}");

      BookingModelUser model = BookingModelUser(
        addressID: selectedAddressID!,
        deviceID: selectedDeviceID!,
        serviceID: selectedServiceID!,
        technicianID: selectedTechnicianID ?? '', // optional
        issue: issueDescription,
      );
      final result=await service.addBookingSer(model);
           if (result["success"]) {
             successMessage = "Booking added successfully";
             notifyListeners();
             return{
              "success":true,
              "technician":result["technician"],
             };
           }else{
            errorMessage = result['message'] ?? "Booking failed";
      notifyListeners();
      return{
        "success": false,
        "message": errorMessage,
      };
           }
      
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
      return {
        "success": false,
      "message": errorMessage,
      };
    }
  }

  void setSelectedDeviceID(String? id) {
  selectedDeviceID = id;
  notifyListeners();
}

void setSelectedServiceID(String id) {
  selectedServiceID = id;
  log("🔵 Device ID set in provider: $id");
  notifyListeners();
}

void setSelectedTechnicianID(String? id) {
  selectedTechnicianID = id;
  notifyListeners();
}

void setSelectedAddressID(String? id) {
  selectedAddressID = id;
  notifyListeners();
}


  void setIssueDescription(String value) {
    issueDescription = value;
    notifyListeners();
  }

  // Clear messages (after showing snackbar/toast)
  void clearMessages() {
    successMessage = '';
    errorMessage = '';
    notifyListeners();
  }
}
