import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/estimateModel.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Estmatedservice {
  Dio dio=Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    )
  );



Future<Estimatemodel?> fetchbookingsEstimate({
  required String technicianId,
  required String addressId,
  required String serviceId,
}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    final response = await dio.get(
      '${ApiConstants.bookingsEstimate}?technicianID=$technicianId&addressID=$addressId&serviceID=$serviceId',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );

    if (response.statusCode == 200&&response.data['data']!=null) {
      final data = response.data['data'];
      log("✅ Booking Estimate Fetched");
      return Estimatemodel.fromJson(data); // ✅ Convert to model
    } else {
      log("❌ Failed to fetch estimate: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    log("❌ Error fetching estimate: $e");
    return null;
  }
}

}