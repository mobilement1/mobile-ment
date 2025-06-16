// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:mobile_servies/user/UserModel/techRequestModel.dart';
// import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TechnicianApplicationService {
//   final Dio _dio = Dio();
//   final String technicianRequestUrl = ApiConstants.technicianRequestUrl;

//   Future<bool> submitApplication(TechnicianApplication application) async {
//     try {
//       log('Preparing to submit technician application...');

//       // Retrieve token from SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       final token = await prefs.getString('auth_token');
//       log('Retrieved token: $token');

//       if (token == null || token.isEmpty) {
//         log('No auth token found');
//         throw Exception('Authentication token is missing or invalid');
//       }

//       // Set headers
//       _dio.options.headers = {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'multipart/form-data',
//       };

//       log('Preparing form data...');
//       // Remove resume from JSON to avoid sending it twice
//       final jsonData = application.toJson()..remove('resume');
//       log('Form data JSON: $jsonData');

//       // Validate and convert fields to correct types
//       final formData = FormData.fromMap(
//         jsonData.map((key, value) {
//           // Convert numeric fields to int if they are strings
//           if (value is String && _isNumeric(value)) {
//             return MapEntry(key, int.parse(value));
//           }
//           return MapEntry(key, value);
//         }),
//       );

//       // Validate resume file path
//       if (application.resumePath.isNotEmpty) {
//         final file = File(application.resumePath);
//         if (await file.exists()) {
//           log('Attaching resume from path: ${application.resumePath}');
//           formData.files.add(MapEntry(
//             'resume',
//             await MultipartFile.fromFile(application.resumePath, filename: 'resume.pdf'),
//           ));
//         } else {
//           log('Resume file does not exist at path: ${application.resumePath}');
//           throw Exception('Resume file not found');
//         }
//       } else {
//         log('No resume path provided');
//         throw Exception('Resume file path is empty');
//       }

//       log('Sending POST request to $technicianRequestUrl...');
//       final response = await _dio.post(
//         technicianRequestUrl,
//         data: formData,
//       );

//       log('Response status: ${response.statusCode}');
//       log('Response data: ${response.data}');

//       return response.statusCode == 200 || response.statusCode == 201;
//     } on DioException catch (e) {
//       log('Dio error during application submission: ${e.message}');
//       log('Dio response data: ${e.response?.data}');
//       log('Dio status code: ${e.response?.statusCode}');

//       if (e.response?.statusCode == 401) {
//         throw Exception(
//           'Authentication failed: Invalid or expired token. Please log in again or refresh the token.',
//         );
//       }
//       throw Exception(
//         e.response?.data['message'] ??
//             'Failed to submit application: ${e.message}',
//       );
//     } catch (e) {
//       log('Unexpected error occurred while submitting application: $e');
//       if (e.toString().contains('is not a subtype of type int')) {
//         throw Exception(
//           'Type error: Ensure all numeric fields in the application are integers',
//         );
//       }
//       throw Exception('Failed to submit application: $e');
//     }
//   }

//   // Helper method to check if a string is numeric
//   bool _isNumeric(String? str) {
//     if (str == null) return false;
//     return int.tryParse(str) != null;
//   }
// }



import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/techRequestModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TechnicianApplicationService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://mobilemend-backend.onrender.com',
    // connectTimeout: const Duration(seconds: 10),
    // receiveTimeout: const Duration(seconds: 10),
  ));
  final String technicianRequestUrl = '/api/Technician/technician-request';

  Future<bool> submitApplication(TechnicianApplication application) async {
    try {
      log('Preparing to submit technician application...');

      // Retrieve token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      log('Retrieved token: ${token != null ? 'present' : 'null'}');

      if (token == null || token.isEmpty) {
        log('❌ No auth token found');
        throw Exception('Authentication token is missing or invalid');
      }

      // Set headers
      _dio.options.headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'multipart/form-data',
      };

      log('Preparing form data...');
      // Remove resume from JSON to avoid sending it twice
      final jsonData = application.toJson()..remove('resume');
      log('Form data JSON: $jsonData');

      // Validate and convert fields
      final formData = FormData.fromMap(
        jsonData.map((key, value) {
          if (value is String && _isNumeric(value)) {
            return MapEntry(key, int.parse(value));
          }
          return MapEntry(key, value);
        }),
      );

      // Validate resume file
      if (application.resumePath.isNotEmpty) {
        final file = File(application.resumePath);
        if (await file.exists()) {
          log('Attaching resume from path: ${application.resumePath}');
          formData.files.add(MapEntry(
            'resume',
            await MultipartFile.fromFile(application.resumePath, filename: 'resume.pdf'),
          ));
        } else {
          log('❌ Resume file does not exist at path: ${application.resumePath}');
          throw Exception('Resume file not found');
        }
      } else {
        log('❌ No resume path provided');
        throw Exception('Resume file path is empty');
      }

      log('Sending POST request to $technicianRequestUrl...');
      final response = await _dio.post(
        technicianRequestUrl,
        data: formData,
      );

      log('Response status: ${response.statusCode}');
      log('Response data: ${response.data}');

      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      log('Dio error during application submission: ${e.message}');
      log('Dio response data: ${e.response?.data}');
      log('Dio status code: ${e.response?.statusCode}');
      if (e.response?.statusCode == 401) {
        throw Exception('Authentication failed: Invalid or expired token');
      }
      throw Exception(e.response?.data['message'] ?? 'Failed to submit application: ${e.message}');
    } catch (e) {
      log('Unexpected error during application submission: $e');
      throw Exception('Failed to submit application: $e');
    }
  }

  // Helper method to check if a string is numeric
  bool _isNumeric(String? str) {
    if (str == null) return false;
    return int.tryParse(str) != null;
  }
}