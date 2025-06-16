import 'dart:developer';

class InProgressModel {
  final String bookingId;
  final String customerName;
  final String deviceDetails;
  final String issue;
  final String location;
  final String status;
  final String addressId;
  final String serviceId;
  final String technicianId;
  final String deviceId;

  InProgressModel({
    required this.bookingId,
    required this.customerName,
    required this.deviceDetails,
    required this.issue,
    required this.location,
    required this.status,
    required this.addressId,
    required this.serviceId,
    required this.technicianId,
    required this.deviceId,
  });

  factory InProgressModel.fromJson(Map<String, dynamic> json) {
    log('ℹ️ Parsing InProgressModel from JSON: $json');
    log('ℹ️ Available JSON keys: ${json.keys.join(', ')}');

    final bookingId = json['bookingID']?.toString() ?? '';
    final customerName = json['customerName']?.toString() ?? 'Unknown';
    final deviceDetails =
        '${json['deviceName'] ?? 'Unknown'} (${json['deviceType'] ?? ''})';
    final issue = json['issue']?.toString() ?? 'No issue specified';

    final street = json['street'] ?? '';
    final city = json['city'] ?? '';
    final pincode = json['pincode']?.toString() ?? '';
    final location =
        '$street, $city, $pincode'.replaceAll(RegExp(r'(, )+'), ', ').trim();

    final status = json['bookingStatus']?.toString() ?? 'Unknown';

    final technicianId = json['technicianID']?.toString() ?? '';
    final serviceId = json['serviceId']?.toString() ?? '';
    final addressId = json['addressId']?.toString() ?? '';
    final deviceId = json['deviceId']?.toString() ?? '';

    log('ℹ️ Parsed values: bookingId=$bookingId, customerName=$customerName, '
        'deviceDetails=$deviceDetails, issue=$issue, location=$location, '
        'status=$status, addressId=$addressId, serviceId=$serviceId, '
        'technicianId=$technicianId, deviceId=$deviceId');

    return InProgressModel(
      bookingId: bookingId,
      customerName: customerName,
      deviceDetails: deviceDetails,
      issue: issue,
      location: location,
      status: status,
      addressId: addressId,
      serviceId: serviceId,
      technicianId: technicianId,
      deviceId: deviceId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'customerName': customerName,
      'deviceDetails': deviceDetails,
      'issue': issue,
      'location': location,
      'status': status,
      'addressId': addressId,
      'serviceId': serviceId,
      'technicianId': technicianId,
      'deviceId': deviceId,
    };
  }
}