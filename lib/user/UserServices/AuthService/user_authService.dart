// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:mobile_servies/main.dart';
// import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
// import 'package:mobile_servies/user/UserModel/AuthModel/loginmodel.dart';
// import 'package:mobile_servies/user/UserModel/AuthModel/registermodel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//   class UserAuthService {
//   final Dio dio = Dio();
//   final String registerUrl = ApiConstants.registerUrl;
//   final String loginUrl = ApiConstants.loginUrl;
//   final String logoutUrl=ApiConstants.logoutUrl;
//   String?userRole;

// UserAuthService(){
//   dio.interceptors.add(InterceptorsWrapper(
//     onError: (DioException e, ErrorInterceptorHandler handler)async {
//       if (e.response?.statusCode==401) {
//         log("Access token expaired  loggin out");
//         //
//         final prefs=await SharedPreferences.getInstance();
//         await prefs.clear();//clear all saved user data
        
//         navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route)=>false);
        
       
//       }
//       return handler.next(e);
//     },
//   ));
// }
//   // REGISTER   
//   Future<String> registerUser(Registermodel user) async {
//     try {
//       log("Sending register data: ${user.toJson()}");

//       final response = await dio.post(
//         registerUrl,
//         data: user.toJson(),
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       log("Register response status: ${response.statusCode}");
//       log("Register response data: ${response.data}");

//       if (response.statusCode == 201||response.statusCode==200) {
//          final message = response.data['message'];
//           log("✅ Registration Message: $message");
        
//         return message??"Registration successful.";
//       } else {
//         return response.data['message'] ?? "Registration failed: ${response.statusMessage}";
        
//       }
//     } on DioException catch (e) {
//       log("Dio error during register: ${e.message}");
//       log("Dio register response data: ${e.response?.data}");
//       log("Dio register status code: ${e.response?.statusCode}");
//       return "Unexpected error: ${e.response?.data ?? e.message}";
//     }
//   }



//   // LOGIN
//   Future<String> loginUser(LoginModel user) async {
//     try {
//       log("Sending login data: ${user.toJson()}");
//  log("baseUrl${dio.options.baseUrl}");
//       final response = await dio.post(
//         loginUrl,
//         data: user.toJson(),
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       log("Login response status: ${response.statusCode}");
//       log("Login response data: ${response.data}");

//       if (response.statusCode == 200) {
//         final token = response.data['data']?['token'];
      
//         userRole=response.data['data']?['role'];
        
//         log("Response token: $token");
//         log("Response role: $userRole");
      
 
//         if (token != null&&token.isNotEmpty) {
//            log("Saving token: $token");
//           final prefs = await SharedPreferences.getInstance();
//           await prefs.setString('auth_token', token);
//           await prefs.setString('user_role', userRole??'user');

          
//          final decoded=JwtDecoder.decode(token);
//          final userId=decoded["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
//          if (userId !=null) {
//            await prefs.setString('user_id', userId);
//             log("User ID saved to SharedPreferences: $userId");
//          }

         
//           log("Token and role saved to SharedPreferences");
          
//         }else{
//             log("❌ Token missing in response.data['data']");
//         }
//         return "success";
//       } else {
//         return response.data['message'] ?? "Login failed: ${response.statusMessage}";
//       }
//     } on DioException catch (e) {
//       log("Dio error during login: ${e.message}");
//       log("Dio login response data: ${e.response?.data}");
//       log("Dio login status code: ${e.response?.statusCode}");
//       return e.response?.data['message'] ?? "Unexpected error";
//     }

    
//    }


//   // GET TOKEN
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token =await prefs.getString('auth_token');
//     log("Token read from SharedPreferences: $token");

//     return token;
//   }

//   // get user role
//   Future<String?>getUserRole()async{
//     final prefs=await SharedPreferences.getInstance();
//     final role=prefs.getString('user_role');
//     log("Token read from sharedprferences:$role");
//     return role;
//   }

//   // LOGOUT
//   Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token=prefs.getString('auth_token');

//     try {
//       if (token!=null&&token.isNotEmpty) {
//         final response=await dio.post(logoutUrl,options:Options(
//           headers: {
//             'Authorization': 'Bearer $token',  
//             'Content-Type': 'application/json',
//           }
//         ) );

//         log("Logout API response status: ${response.statusCode}");
//       log("Logout API response data: ${response.data}");
//       }else{
//          log("No auth token found, skipping logout API call");
//       }
//     } catch (e) {
//       log("Error calling logout API: $e");
//     }
//     await prefs.remove('auth_token');
    
//     await prefs.remove('user_role');
    
//     log("Token removed from SharedPreferences");
//   }
//   //User Details

//   Future<Map<String,dynamic>?>getUserDetails()async{
//     try {
//       final prefs=await SharedPreferences.getInstance();
//       final token=prefs.getString("auth_token");
//       if (token==null||token.isEmpty) {
//        log("No token found.user might not be logged in.") ;
//        return null;
//       }
//       final response=await dio.get(ApiConstants.authme,
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//         }
//       )
//       );
//       if (response.statusCode == 200) {
//      log("👤 Full response body: ${response.data}");
  
//   final userData = response.data;
//   if (userData == null) {
//     log("❌ 'data' field is null in API response.");
//     return null;
//   }
//   log("✅ user details fetched: $userData");
//   return userData;
// }

//       else{
//        log("⚠️ Failed to get user details: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//        log("Error fetching user details:$e");
//        return null;
//     }
//   }
// }





import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_servies/main.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/loginmodel.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/registermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseURL,
    // connectTimeout: const Duration(seconds: 10),
    // receiveTimeout: const Duration(seconds: 10),
  ));
  
  String? userRole;

  UserAuthService() {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, ErrorInterceptorHandler handler) async {
        if (e.response?.statusCode == 401) {
          log("Access token expired - logging out");
          final prefs = await SharedPreferences.getInstance();
          await prefs.clear(); // clear all saved user data
          navigatorKey.currentState?.pushNamedAndRemoveUntil('/login', (route) => false);
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
        ApiConstants.registerUrl,
        data: user.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      log("Register response status: ${response.statusCode}");
      log("Register response data: ${response.data}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        final message = response.data['message'];
        log("✅ Registration Message: $message");
        return message ?? "Registration successful.";
      } else {
        return response.data['message'] ?? "Registration failed: ${response.statusMessage}";
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
      log("baseUrl: ${dio.options.baseUrl}");

      final response = await dio.post(
        ApiConstants.loginUrl,
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
        userRole = response.data['data']?['role'];
        
        log("Response token: $token");
        log("Response role: $userRole");

        if (token != null && token.isNotEmpty) {
          log("Saving token: $token");
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', token);
          await prefs.setString('user_role', userRole ?? 'user');

          final decoded = JwtDecoder.decode(token);
          final userId = decoded["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];
          if (userId != null) {
            await prefs.setString('user_id', userId);
            log("User ID saved to SharedPreferences: $userId");
          }

          log("Token and role saved to SharedPreferences");
        } else {
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
    final token = await prefs.getString('auth_token');
    log("Token read from SharedPreferences: ${token != null ? 'present' : 'null'}");
    return token;
  }

  // GET USER ROLE
  Future<String?> getUserRole() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString('user_role');
    log("Role read from SharedPreferences: $role");
    return role;
  }

  // GET TECHNICIAN ID
  Future<String?> getTechnicianId() async {
    try {
      final token = await getToken();
      if (token == null) {
        log('❌ No token found for technician ID');
        return null;
      }

      final response = await dio.get(
        '/api/Auth/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      log("Get technician ID response: ${response.data}");

      if (response.statusCode == 200) {
        final technicianId = response.data['technicianId']?.toString() ??
            response.data['id']?.toString();
        log("Extracted technicianId: $technicianId");
        return technicianId;
      }
      log("❌ Failed to fetch technician ID: Status ${response.statusCode}");
      return null;
    } on DioException catch (e) {
      log("❌ Error fetching technician ID: ${e.response?.data ?? e.message}");
      return null;
    }
  }

  // LOGOUT
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    try {
      if (token != null && token.isNotEmpty) {
        final response = await dio.post(
          ApiConstants.logoutUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
          ),
        );
        log("Logout API response status: ${response.statusCode}");
        log("Logout API response data: ${response.data}");
      } else {
        log("No auth token found, skipping logout API call");
      }
    } catch (e) {
      log("Error calling logout API: $e");
    }
    await prefs.remove('auth_token');
    await prefs.remove('user_role');
    log("Token and role removed from SharedPreferences");
  }

  // USER DETAILS
  Future<Map<String, dynamic>?> getUserDetails() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("auth_token");
      if (token == null || token.isEmpty) {
        log("No token found. User might not be logged in.");
        return null;
      }
      
      final response = await dio.get(
        ApiConstants.authme,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          }
        )
      );
      
      if (response.statusCode == 200) {
        log("👤 Full response body: ${response.data}");
        final userData = response.data;
        
        if (userData == null) {
          log("❌ 'data' field is null in API response.");
          return null;
        }
        
        log("✅ user details fetched: $userData");
        return userData;
      } else {
        log("⚠ Failed to get user details: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      log("Error fetching user details: $e");
      return null;
    }
  }
}