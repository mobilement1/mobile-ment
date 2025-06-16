import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_servies/main.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/loginmodel.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/registermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserAuthService {
  final Dio dio = Dio();
  final String registerUrl = ApiConstants.registerUrl;
  final String loginUrl = ApiConstants.loginUrl;
  final String logoutUrl=ApiConstants.logoutUrl;
  String?userRole;
 // ✅ ADDED: Interceptor inside constructor
UserAuthService(){
  dio.interceptors.add(InterceptorsWrapper(
    onError: (DioException e, ErrorInterceptorHandler handler)async {
      if (e.response?.statusCode==401) {
        log("Access token expaired  loggin out");
        //
        final prefs=await SharedPreferences.getInstance();
        await prefs.clear();//clear all saved user data
        //navigate to login
        navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route)=>false);
        
        //
        // final refreshed=await refreshAccessToken();
        // if (refreshed) {
        //   final prefs=await SharedPreferences.getInstance();
        //   final newToken=prefs.getString('auth_token');
        //   final clonedRequest=e.requestOptions;
        //   clonedRequest.headers['Athorization']='Bearer $newToken';
        //   try {
        //     final response=await dio.fetch(clonedRequest);
        //     return handler.resolve(response);
        //   } catch (err) {
        //     log("Retry failed after refresh");
        //     return handler.reject(err as DioException);
        //   }
        // }else{
        //   log("Refresh token failed.Logging out");
        //   return handler.reject(e);
        // }
      }
      return handler.next(e);
    },
  ));
}
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

      if (response.statusCode == 201||response.statusCode==200) {
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
 log("baseUrl${dio.options.baseUrl}");
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
        final token = response.data['data']?['token'];
        // final refreshToken=response.data['data']?['refreshToken'];
        userRole=response.data['data']?['role'];
        
        log("Response token: $token");
        log("Response role: $userRole");
        // log("Response refreshToken$refreshToken");
 
        if (token != null&&token.isNotEmpty) {
           log("Saving token: $token");
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          await prefs.setString('user_role', userRole??'user');

          // if (refreshToken !=null && refreshToken.isNotEmpty) {
          //   await prefs.setString('refresh_token', refreshToken);
          //   log("RefreshToken saved to shared preferences");
          // }else{
          //   log("Refreshtoken not found in response");
          // }
          //
         final decoded=JwtDecoder.decode(token);
         final userId=decoded["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
         if (userId !=null) {
           await prefs.setString('user_id', userId);
            log("User ID saved to SharedPreferences: $userId");
         }
          log("Token and role saved to SharedPreferences");
          
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
//  REFRESH ACCESS TOKEN
//   Future<bool> refreshAccessToken()async{
// final prefs=await SharedPreferences.getInstance();
// final userId=prefs.getString('user_id');
// final refreshToken=prefs.getString('refresh_token');
// if (userId==null || refreshToken==null) {
//   log("cannot refreshtoken :userId or refrshtoken missing");
//   return false;
// }
// try {
//   final response=await dio.post('${ApiConstants.baseURL}/api/Auth/refresh-token?userid=$userId',
//   options: Options(
//     headers: {
//       'Authorization':'Bearer $refreshToken',
//       'Content-Type':'application/json',
//     }
//   )
//   );
//   if (response.statusCode==200) {
//     final newToken=response.data['data']?['token'];
//     if (newToken!=null && newToken.isNotEmpty) {
//       await prefs.setString('auth_token', newToken);
//       log('Access token refreshed and saved');
//       return true;
//     }else{
//        log("Refresh API success but token missing");
//     }
//   }else{
//     log("Refresh api failed:${response.statusCode}");
//   }
// } catch (e) {
//   log("error during token refersh:$e");
// }
// return false;
//   }

  // GET TOKEN
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token =await prefs.getString('auth_token');
    log("Token read from SharedPreferences: $token");

    return token;
  }

  // get user role
  Future<String?>getUserRole()async{
    final prefs=await SharedPreferences.getInstance();
    final role=prefs.getString('user_role');
    log("Token read from sharedprferences:$role");
    return role;
  }

  // LOGOUT
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token=prefs.getString('auth_token');

    try {
      if (token!=null&&token.isNotEmpty) {
        final response=await dio.post(logoutUrl,options:Options(
          headers: {
            'Authorization': 'Bearer $token',  
            'Content-Type': 'application/json',
          }
        ) );

        log("Logout API response status: ${response.statusCode}");
      log("Logout API response data: ${response.data}");
      }else{
         log("No auth token found, skipping logout API call");
      }
    } catch (e) {
      log("Error calling logout API: $e");
    }
    await prefs.remove('auth_token');
    // await prefs.remove('refresh_token'); 
    await prefs.remove('user_role');
    
    log("Token removed from SharedPreferences");
  }
}
