import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_servies/constants/constant_api/const_url.dart';
import 'package:mobile_servies/user/UserModel/loginmodel.dart';
import 'package:mobile_servies/user/UserModel/registermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserAuthService {
  final Dio dio = Dio();
  final String registerUrl = ApiConstants.registerUrl;
  final String loginUrl = ApiConstants.loginUrl;

  // REGISTER
  Future<String> registerUser(Registermodel user) async {
    try {
      log("Sending register data: ${user.toJson()}");

      final response = await dio.post(
        registerUrl,
        data: user.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      log("Register response status: ${response.statusCode}");
      log("Register response data: ${response.data}");

      if (response.statusCode == 201) {
        final token = response.data['data']?['token']as String;
        log("Response token: $token");

        if (token.isNotEmpty) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          log("Token saved to SharedPreferences register");
        }
        return "success";
      } else {
        return "Registration failed: ${response.statusMessage}";
      }
    } on DioException catch (e) {
      log("Dio error during register: ${e.message}");
      log("Dio register response data: ${e.response?.data}");
      log("Dio register status code: ${e.response?.statusCode}");
      return "Unexpected error: ${e.response?.data ?? e.message}";
    }
  }

  // LOGIN
  Future<String> loginUser(LoginModel user) async {
    try {
      log("Sending login data: ${user.toJson()}");

      final response = await dio.post(
        loginUrl,
        data: user.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      log("Login response status: ${response.statusCode}");
      log("Login response data: ${response.data}");

      if (response.statusCode == 200) {
        final token = response.data['data']?['token']as String?;
        log("Response token: $token");

        if (token != null&&token.isNotEmpty) {
           log("Saving token: $token");
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          log("Token saved to SharedPreferences");
          
        }else{
            log("❌ Token missing in response.data['data']");
        }
        return "success";
      } else {
        return response.data['message'] ?? "Login failed: ${response.statusMessage}";
      }
    } on DioException catch (e) {
      log("Dio error during login: ${e.message}");
      log("Dio login response data: ${e.response?.data}");
      log("Dio login status code: ${e.response?.statusCode}");
      return e.response?.data['message'] ?? "Unexpected error";
    }
  }

  // GET TOKEN
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token =await prefs.getString('auth_token');
    log("Token read from SharedPreferences: $token");
    return token;
  }

  // LOGOUT
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    log("Token removed from SharedPreferences");
  }
}
