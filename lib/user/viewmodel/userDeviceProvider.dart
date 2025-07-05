import 'package:flutter/material.dart';
import 'package:mobile_servies/user/UserModel/DeviceModel/userDeviceModel.dart';
import 'package:mobile_servies/user/UserServices/UserDeviceService/userDeviceService.dart';


class UserDeviceProvider with ChangeNotifier {
  final Userdeviceservice service = Userdeviceservice();

  List<Userdevicemodel> devices = [];
  List<Userdevicemodel>filteredDevice=[];
  bool isLoading = false;

  Future<void> fetchDevices() async {
    isLoading = true;
    notifyListeners();

    devices = await service.getAllDevices();
    filteredDevice = devices;
    
    isLoading = false;
    notifyListeners();
  }

   void filteredDevices(String query){
    if (query.isEmpty) {
      filteredDevice=devices;
    }else{
filteredDevice=devices.where((device)=>
    device.deviceName.toLowerCase().startsWith(query.toLowerCase())
    
    ).toList();
    }
    
    notifyListeners();
   }
}
