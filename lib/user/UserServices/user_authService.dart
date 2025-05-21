import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_servies/constants/constant_api/const_url.dart';
import 'package:mobile_servies/user/UserModel/loginmodel.dart';
import 'package:mobile_servies/user/UserModel/registermodel.dart';

class UserAuthService {
  final Dio dio = Dio();
  final String registerUrl = ApiConstants.registerUrl;
  final String loginUrl = ApiConstants.loginUrl;
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<String> registerUser(Registermodel user) async {
    try {
      final response = await dio.post(registerUrl, data: user.toJson());
      if (response.statusCode == 201) {
        final token = response.data['token'];
        await secureStorage.write(key: 'auth_token', value: token);
        return "success";
      } else {
        return "Registration failed: ${response.statusMessage}";
      }
    } on DioException catch (e) {
      log("${e.message}");
     
      return "Unexpected error";
    }
  }

  Future<String> loginUser(LoginModel user) async {
    try {
      final response = await dio.post(loginUrl, data: user.toJson());
      if (response.statusCode == 200) {
        final token = response.data['token'];
        await secureStorage.write(key: 'auth_token', value: token);
        return "success";
      } else {
        return "Login failed: ${response.statusMessage}";
      }
    } on DioException catch (e) {
      log(" ${e.message}");
      return "Unexpected error:";
    }
  }
//get token

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'auth_token');
  }

  // logout
  Future<void> logout() async {
    await secureStorage.delete(key: 'auth_token');
  }
}
