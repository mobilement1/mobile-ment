import 'package:dio/dio.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/repairModel.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
class BookingService {
  Dio dio=Dio();

  
   Future<void>addBooking(BookingModel booking)async{
    try {
      final request=await dio.post(ApiConstants.confirmBooking,data: booking.toJson());
    if (request.statusCode == 200 || request.statusCode == 201) {
        print('Booking successful: ${request.data}');
      } else {
        print('Failed with status: ${request.statusCode}');
      }
    } catch (e) {
        print('Error during booking: $e');
    }  
   }

   Future<List<BookingModel>>fetchBooking()async{
   try {
     final response=await dio.get(ApiConstants.getBooking);
     return (response.data as List).map((json)=>BookingModel.fromJson(json)).toList();
     
   } catch (e) {
     print('GET Error: $e');
      rethrow;
   }
   }
}