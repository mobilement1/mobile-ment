// import 'package:dio/dio.dart';
// import 'package:mobile_servies/user/UserModel/techRequestModel.dart';

// class BecomTechnicianRqstService {
//   final Dio _dio = Dio();
//   final String _baseUrl = 'https://mobilemend-backend.onrender.com/api/Technician';

//   Future<Map<String, dynamic>> submitTechnicianApplication(BecomeTechnicianRqstModel technician, String resumePath) async {
//     try {
//       FormData formData = FormData.fromMap({
//         'Experience': technician.experience,
//         'Specialization': technician.specialization,
//         'Bio': technician.bio,
//         'Place': technician.place,
//         'Longitude': technician.longitude,
//         'Latitude': technician.latitude,
//         'Resume': await MultipartFile.fromFile(resumePath, filename: 'resume.pdf'),
//       });

//       Response response = await _dio.post(
//         '$_baseUrl/technician-request',
//         data: formData,
//         options: Options(
//           headers: {
//             'Content-Type': 'multipart/form-data',
//           },
//         ),
//       );

//       return {
//         'success': true,
//         'data': response.data,
//       };
//     } catch (e) {
//       return {
//         'success': false,
//         'error': e is DioException ? e.response?.data.toString() ?? e.message : e.toString(),
//       };
//     }
//   }
// }