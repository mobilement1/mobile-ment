import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/DeviceModel/userDeviceModel.dart';

import 'package:mobile_servies/user/constants/constant_api/const_url.dart';

class Userdeviceservice {
  final Dio dio=Dio();
  Future<List<Userdevicemodel>>getAllDevices()async{
    try {
      final response=await dio.get(ApiConstants.devicebooking);
if (response.statusCode==200) {
  final List data=response.data['data'];
  return data.map((json)=>Userdevicemodel.fromJson(json)).toList();
  
}else{
  log("error ${response.statusCode}");
  return [];
}
    } catch (e) {
      log("Fetch devices failed: $e");
      return [];
    }

  }
}