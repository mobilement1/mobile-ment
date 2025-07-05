class ApiConstants {
  static const String baseURL="https://mobilemend-backend.onrender.com";
  static const registerUrl="${baseURL}/api/Auth/register";
  static const loginUrl="${baseURL}/api/Auth/login";
  static const logoutUrl="$baseURL/api/Auth/logout";
static const confirmBooking="${baseURL}/api/Booking/confirm-booking";
static const getBooking="${baseURL}/api/Booking/get-booking";
static const addAddress="${baseURL}/api/Address/add-address";
static const getAddress="${baseURL}/api/Address/get-address";
static const deleteAddress="${baseURL}/api/Address/remove-address";
static const devicebooking="${baseURL}/api/Device/get-device";
static const serviceBooking="${baseURL}/api/Service/get-service";
static const getBestTechnicians="${baseURL}/api/Technician/get-best-technicians";
static const bookingsEstimate="${baseURL}/api/Booking/get-booking-estimate";
static const authme="${baseURL}/api/Auth/me";
static const getTechnician="${baseURL}/api/Technician/get-technicians";
static const updateAddress = "$baseURL/api/Address/update-address";


}