import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/ServiceModel/userServiceModel.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';

class UserServiceService {
  final Dio dio = Dio();

  Future<List<Userservicemodel>> fetchAllServices() async {
    try {
      final response = await dio.get(ApiConstants.serviceBooking); // replace with correct URL
      if (response.statusCode == 200) {
        final List data = response.data['data'];
        return data.map((json) => Userservicemodel.fromJson(json)).toList();
      } else {
        log("❌ Failed to fetch services: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      log("❌ Error fetching services: $e");
      return [];
    }
  }
}
