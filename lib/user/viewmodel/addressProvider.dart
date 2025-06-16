

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart'; // For LatLng
import 'package:mobile_servies/user/UserModel/AddressModel/addressModel.dart';
import 'package:mobile_servies/user/UserServices/AddressService/addressService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addressprovider extends ChangeNotifier {
  final AddressService service = AddressService();

  // Controllers for form fields
  TextEditingController addressName = TextEditingController();
  TextEditingController streetAddress = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  LatLng? selectedLatLng; 
String fullAddress = ''; 



String?selectedAddressID;
  String? selectedAddress;
int? selectedIndex;

void setSelectedAddress(String address,String id, int index) {
  selectedAddress = address;
  selectedIndex = index;
  selectedAddressID=id;
  saveSelectedAddress(index,);
  notifyListeners();
}
Future<void> saveSelectedAddress(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id'); 
if (userId != null) {
    await prefs.setString("selected_address_$userId", selectedAddress ?? "");
    await prefs.setInt("selected_index_$userId", index);
  }
    // await prefs.setString("selected_address", selectedAddress ?? "");
    // await prefs.setInt('selected_index', index);
    notifyListeners();
  }


  Future<void> loadSelectedAddress() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
      log("🟢 [loadSelectedAddress] user_id = $userId");
    if (userId != null) {
    selectedAddress = prefs.getString("selected_address_$userId");
    selectedIndex = prefs.getInt("selected_index_$userId");
    log("🟢 Loaded address for $userId = $selectedAddress");
  }else{
       log("❌ user_id not found during loadSelectedAddress");
  }
    // selectedAddress = prefs.getString("selected_address");
    // selectedIndex=prefs.getInt('selected_index');
    notifyListeners();
  }
  
  List<AddressModel> addressList = [];

  bool isLoading = false;
  String errorMessage = '';
  String successMessage = '';

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void clearMessages() {
    errorMessage = '';
    successMessage = '';
    notifyListeners();
  }

  // Update selected location and sync latitude & longitude
  void setSelectedLocation(LatLng latLng)async {
    selectedLatLng = latLng;
    try {
      List<Placemark>placemarks=await placemarkFromCoordinates(
        latLng.latitude, latLng.longitude
        );
        if (placemarks.isNotEmpty) {
          Placemark place=placemarks.first;
          fullAddress="${place.subLocality??''}, ${place.locality??''}, ${place.subAdministrativeArea??''}"
          "${place.administrativeArea??''}, ${place.postalCode??''}, ${place.country}";
        }else{
           fullAddress = "No address found for this location.";
        }
    } catch (e) {
       fullAddress = "Failed to get address: $e";
    }
    
    notifyListeners();
  }


  Future<void> updateLocationFromAddress() async {
    try {
      String address = "${streetAddress.text.trim()}, ${cityController.text.trim()}, "
                       "${stateController.text.trim()}, ${pincodeController.text.trim()}";

      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        selectedLatLng = LatLng(location.latitude, location.longitude);

        // Optionally update fullAddress string as well
        fullAddress = address;

        errorMessage = '';
      } else {
        errorMessage = "No location found for the given address.";
      }
    } catch (e) {
      errorMessage = "Failed to get location from address: $e";
    }
    notifyListeners();
  }

  bool validateFields() {
    if (addressName.text.isEmpty ||
        streetAddress.text.isEmpty ||
        cityController.text.isEmpty ||
        stateController.text.isEmpty ||
        pincodeController.text.isEmpty ||
        selectedLatLng == null) {
      errorMessage = "Please fill all the fields including selecting location on map";
      successMessage = '';
      notifyListeners();
      return false;
    }
    errorMessage = '';
    successMessage = '';
    notifyListeners();
    return true;
  }

  Future<bool> addAddressProvider() async {
    clearMessages();

    if (!validateFields()) return false;

    setLoading(true);

    final newAddress = AddressModel(
      id: '', // Assuming API generates this
      addressDetail: addressName.text.trim(),
      street: streetAddress.text.trim(),
      city: cityController.text.trim(),
      state: stateController.text.trim(),
      pincode: pincodeController.text.trim(),
      latitude: selectedLatLng!.latitude,
      longitude: selectedLatLng!.longitude,
    );

    try {
      final result = await service.addAddressUser(newAddress);
      setLoading(false);

      if (result == "success") {
        successMessage = "Address added successfully!";
        errorMessage = '';
        await getAddressList();
        // Clear all inputs after success
        addressName.clear();
        streetAddress.clear();
        cityController.clear();
        stateController.clear();
        pincodeController.clear();
        selectedLatLng = null;
       selectedLatLng=null;
        notifyListeners();
        return true;
      } else {
        errorMessage = result;
        successMessage = '';
        notifyListeners();
        return false;
      }
    } catch (e) {
      setLoading(false);
      errorMessage = e.toString();
      successMessage = '';
      notifyListeners();
      return false;
    }
  }

  Future<void> getAddressList() async {
  setLoading(true);
  try {
    addressList = await service.getAddressUser();
  } catch (e) {
    errorMessage = "Failed to fetch address list: $e";
  } finally {
    setLoading(false);
    notifyListeners();
  }
}

Future<void> clearSelectedAddress() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('user_id');
  if (userId != null) {
    await prefs.remove("selected_address_$userId");
    await prefs.remove("selected_index_$userId");
  }

  // await prefs.remove("selected_address");
  // await prefs.remove("selected_index");

  selectedAddress = null;
  selectedIndex = null;
  notifyListeners();
}



  @override
  void dispose() {
    addressName.dispose();
    streetAddress.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.dispose();
  }
}
