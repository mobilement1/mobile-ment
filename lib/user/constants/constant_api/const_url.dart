class ApiConstants {
  static const String baseURL="https://mobilemend-backend.onrender.com";
  static const registerUrl="https://mobilemend-backend.onrender.com/api/Auth/register";
  static const loginUrl="https://mobilemend-backend.onrender.com/api/Auth/login";
  static const logoutUrl="$baseURL/api/Auth/logout";
  static const technicianRequestUrl="$baseURL/api/Technician/technician-request";
  static const getRequestsUrl="$baseURL/api/Technician/get-requests";
  static const updateRequestStatusUrl="$baseURL/api/Technician/update-request-status";
  static const getAllTechs="$baseURL/api/Technician/get-technicians";
  static const getAllBookingsAdmin="$baseURL/api/Booking/get-booking";
 static const String getAllDevice = '/api/Device/get-device';
  static const String addDevice = '/api/Device/add-device';
  static const String updateDevice = '/api/Device/update-device';
  static const String deleteDevice = '/api/Device/delete-device';

}