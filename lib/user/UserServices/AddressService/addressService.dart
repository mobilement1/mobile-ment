import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/AddressModel/addressModel.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressService {
  Dio dio = Dio();

  Future<String> addAddressUser(AddressModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
final token = prefs.getString('auth_token');
log('Auth token: $token');
log('Sending address data: ${user.toJson()}');
      final response = await dio.post(ApiConstants.addAddress, 
      data: user.toJson(),
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
           'Content-Type': 'application/json',
        },
      ),
      );
      if (response.statusCode == 201||response.statusCode==200) {
        log("Add address successful: ${response.data}");
        return "success";
      } else {
        log('Failed to add address: ${response.statusMessage}');
        return response.data['message'] ?? 'Failed to add address: ${response.statusMessage}';
      }
    } on DioException catch (e) {
      log('DioException in addAddressUser: $e');
      return e.response?.data['message'] ?? "Unexpected error";
    }
  }

  Future<List<AddressModel>> getAddressUser() async {
    try {

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      if (token == null || token.isEmpty) {
  log("No auth token found. Please login again.");
  return [];
}
      // log('Auth token: $token');
      final response = await dio.get(
        ApiConstants.getAddress,
        options: Options(
      headers: {
      'Authorization': 'Bearer $token',
       'Content-Type': 'application/json',
    },
  ),
        );
     
      
      
      final List data = response.data['data'];
       log("Successfully fetched addresses");
      return data.map((json) => AddressModel.fromJson(json)).toList();
    } on DioException catch (e) {
      log("DioException in getAddressUser: $e");
      // Return empty list or rethrow based on your app logic
      return [];
    } catch (e) {
      log("Unexpected error in getAddressUser: $e");
      throw Exception("$e");
    }
  }

  Future<String> deleteAddressUser(String id) async {
    try {
       final prefs = await SharedPreferences.getInstance();
final token = prefs.getString('auth_token');
      final response = await dio.delete("${ApiConstants.deleteAdderess}/$id",
      options: Options(
        headers:  {
      'Authorization': 'Bearer $token',
       'Content-Type': 'application/json',
    },
  ),
      );
      
      if (response.statusCode == 200 || response.statusCode == 204) {
        log("Successfully deleted address");
        return "success";
      } else {
        log("Delete failed: ${response.statusMessage}");
        return response.data['message'] ?? "Failed to delete";
      }
    } on DioException catch (e) {
      log("DioException in deleteAddressUser: $e");
      return e.response?.data['message']?.toString() ?? e.message ?? "Unexpected delete error";
    }
  }
}
