import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:mobile_servies/user/UserModel/AddressModel/addressModel.dart';

import 'package:mobile_servies/user/UserModel/RepairModel/repairModel.dart';
import 'package:mobile_servies/user/UserServices/RepairServices/repairService.dart';


class BookingProviderUser with ChangeNotifier {
  final BookingServiceUSer service = BookingServiceUSer();

  List<BookingModelUser> bookings = [];
  AddressModel?selectedAddressModel;
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
      bookings = await service.fetchBookingSer();
      
      log("📦 Total bookings fetched: ${bookings.length}");

     
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
    if (selectedDeviceID == null||selectedAddressModel==null) {
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
log("Device ID: $selectedDeviceID");
    log("Service ID: $selectedServiceID");
    log("Address ID: $selectedAddressID");
    log("Technician ID: $selectedTechnicianID");
    log("Issue: $issueDescription");
      BookingModelUser model = BookingModelUser(
        addressID: selectedAddressID!,
        deviceID: selectedDeviceID!,
        serviceID: selectedServiceID!,
        technicianID: selectedTechnicianID ?? '', // optional
        issue: issueDescription,
        date: DateTime.now().toIso8601String(), 
      );
      final result=await service.addBookingSer(model);
           if (result["success"]) {
             successMessage = "Booking added successfully";


            Map<String, dynamic>? technicianInfo;
      if (model.technicianID != null && model.technicianID!.isNotEmpty) {
        technicianInfo = await service.fetchTechnicianById(model.technicianID!);
      }
             
             return{
              "success":true,
              "technician": technicianInfo?['name'] ??''
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

void setSelectedAddressID(String? id,AddressModel?address) {
  selectedAddressID = id;
  selectedAddressModel=address;
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
