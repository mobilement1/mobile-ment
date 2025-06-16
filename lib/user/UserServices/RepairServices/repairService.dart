import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/repairModel.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BookingServiceUSer {
  Dio dio=Dio();

  
   Future<Map<String,dynamic>>addBookingSer(BookingModelUser booking)async{
    try {
      
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      final json = booking.toJson();
log('📦 Booking Request JSON: $json');

final response = await dio.post(ApiConstants.confirmBooking, data: json,

      // final response=await dio.post(ApiConstants.confirmBooking,data: booking.toJson(),
      options: Options(headers: {
        'Authorization': 'Bearer $token',
       'Content-Type': 'application/json',
      })
      );
    if (response.statusCode == 201|| response.statusCode == 200) {
      final technicianData=response.data['data'];
        log('Booking successful, $technicianData'); 
        return {
          "success":true,
          "technician":technicianData,
        };
      } else {
        return {
          "success":false,
          "message":response.data['message']??'Booking failed',
        };
       
      }
    } catch (e) {
        log('Error during booking: $e');
        return {
      "success": false,
      "message": e.toString(),
    };
    }  
   }

   // ✅ Get nearby best technicians using addressId and deviceId
Future<List<dynamic>> getBestTechnicians(String addressId, String deviceId) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('auth_token');

  try {
    final response = await dio.get(
      '${ApiConstants.getBestTechnicians}?customerAddressId=$addressId&deviceId=$deviceId',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }),
    );

    if (response.statusCode == 200) {
      final technicians = response.data['data'] as List;
      log('👀 Technicians List Type: ${technicians.runtimeType}');

      log('✅ Technicians fetched: $technicians');
      log('✅ Technician count: ${technicians.length}');
      return technicians;
    } else {
      log('❌ Technician fetch failed: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    log('❌ Error in getBestTechnicians: $e');
    return [];
  }
}


   Future<List<BookingModelUser>>fetchBookingSer()async{
   try {
    final prefs=await SharedPreferences.getInstance();
    final token=prefs.getString("auth_token");
     final response=await dio.get(ApiConstants.getBooking,options: Options(headers: {
      'Authorization': 'Bearer $token',
       'Content-Type': 'application/json',

     }));
     final data = response.data['data'] as List;
return data.map((json) => BookingModelUser.fromJson(json)).toList();

     
   } catch (e) {
     log('GET Error: $e');
      rethrow;
   }
   }
}