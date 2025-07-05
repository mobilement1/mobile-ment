import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/admin/Model/add_device_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';

class DeviceService {
  final Dio _dio;

  DeviceService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.baseURL,
            headers: {'Content-Type': 'application/json'},
            validateStatus: (status) => status! < 500, 
          ),
        );

  Future<String?> _getAuthToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      log('Auth token: $token');
      return token;
    } catch (e) {
      log('Error getting token: $e');
      return null;
    }
  }

  Future<List<Device>> getDevices() async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      log('➡ Fetching: ${ApiConstants.baseURL}/api/Device/get-device');
      final response = await _dio.get(
        '/api/Device/get-device',
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[getDevices] Raw Response: ${response.data}');
      final responseData = response.data as Map<String, dynamic>;
      final List<dynamic> devices = responseData['data'];
      return devices.map((json) => Device.fromJson(json)).toList();
    } on DioException catch (e) {
      log('[getDevices] Dio error: ${e.message}, Response: ${e.response?.data}');
      throw Exception('Error fetching devices: ${e.message}');
    } catch (e) {
      log('[getDevices] Error: $e');
      throw Exception('Error fetching devices: $e');
    }
  }

  Future<String?> addDevice(Device device) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      final data = device.toJson();
      log('[addDevice] Sending data: $data');
      final response = await _dio.post(
        '/api/Device/add-device',
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[addDevice] Status: ${response.statusCode}, Response: ${response.data}');
      if (response.statusCode != 200) {
        throw Exception('Failed to add device: ${response.data}');
      }

      final responseData = response.data as Map<String, dynamic>;
      return responseData['deviceID']?.toString();
    } on DioException catch (e) {
      log('[addDevice] Dio error: ${e.message}, Response: ${e.response?.data}');
      throw Exception('Error adding device: ${e.message}');
    }
  }

  Future<void> updateDevice(Device device) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      final data = device.toJson();
      log('[updateDevice] Sending data: $data');
      final response = await _dio.put(
        '/api/Device/update-device',
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[updateDevice] Status: ${response.statusCode}, Response: ${response.data}');
      if (response.statusCode != 200) {
        throw Exception('Failed to update device: ${response.data}');
      }
    } on DioException catch (e) {
      log('[updateDevice] Dio error: ${e.message}, Response: ${e.response?.data}');
      throw Exception('Error updating device: ${e.message}');
    }
  }

  Future<void> deleteDevice(String deviceId) async {
    try {
      final authToken = await _getAuthToken();
      if (authToken == null) throw Exception('Token not found');

      log('[deleteDevice] Deleting deviceId: $deviceId');
      final response = await _dio.delete(
        '/api/Device/delete-device',
        queryParameters: {'deviceId': deviceId},
        options: Options(headers: {'Authorization': 'Bearer $authToken'}),
      );

      log('[deleteDevice] Status: ${response.statusCode}, Response: ${response.data}');
      if (response.statusCode != 200) {
        throw Exception('Failed to delete device: ${response.data}');
      }
    } on DioException catch (e) {
      log('[deleteDevice] Dio error: ${e.message}, Response: ${e.response?.data}');
      throw Exception('Error deleting device: ${e.message}');
    }
  }
}