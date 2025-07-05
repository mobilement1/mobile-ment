import 'dart:developer';

class CompletedModel {
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
  final double serviceFee;
  final double bookingFee;
  final double travelAllowances;

  CompletedModel({
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
    this.serviceFee = 0.0,
    this.bookingFee = 0.0,
    this.travelAllowances = 0.0,
  });

  factory CompletedModel.fromJson(Map<String, dynamic> json) {
    log('ℹ Parsing CompletedModel from JSON: $json');
    log('ℹ Available JSON keys: ${json.keys.join(', ')}');

    final bookingId = json['bookingID']?.toString() ?? '';
    final customerName = json['customerName']?.toString() ?? 'Unknown';
    final deviceDetails =
        '${json['deviceName'] ?? 'Unknown'} (${json['deviceType'] ?? ''})';
    final issue = json['issue']?.toString() ?? 'No issue specified';

    final street = json['street']?.toString() ?? '';
    final city = json['city']?.toString() ?? '';
    final pincode = json['pincode']?.toString() ?? '';
    final location =
        '$street, $city, $pincode'.replaceAll(RegExp(r'(, )+'), ', ').trim();

    final status = json['bookingStatus']?.toString() ?? 'Unknown';

    final technicianId = json['technicianID']?.toString() ?? '';
    final serviceId = json['serviceId']?.toString() ?? '';
    final addressId = json['addressId']?.toString() ?? '';
    final deviceId = json['deviceId']?.toString() ?? '';

    // Parse cost fields from bookingCostDetails
    final bookingCostDetails = json['bookingCostDetails'] as Map<String, dynamic>? ?? {};
    log('ℹ bookingCostDetails: $bookingCostDetails');
    final serviceFee = (bookingCostDetails['serviceCharge'] is num)
        ? (bookingCostDetails['serviceCharge'] as num).toDouble()
        : double.tryParse(bookingCostDetails['serviceCharge']?.toString() ?? '0.0') ?? 0.0;
    final bookingFee = (bookingCostDetails['bookingCharge'] is num)
        ? (bookingCostDetails['bookingCharge'] as num).toDouble()
        : double.tryParse(bookingCostDetails['bookingCharge']?.toString() ?? '0.0') ?? 0.0;
    final travelAllowances = (bookingCostDetails['travelAllowance'] is num)
        ? (bookingCostDetails['travelAllowance'] as num).toDouble()
        : double.tryParse(bookingCostDetails['travelAllowance']?.toString() ?? '0.0') ?? 0.0;

    log('ℹ Parsed values: bookingId=$bookingId, customerName=$customerName, '
        'deviceDetails=$deviceDetails, issue=$issue, location=$location, '
        'status=$status, addressId=$addressId, serviceId=$serviceId, '
        'technicianId=$technicianId, deviceId=$deviceId, '
        'serviceFee=$serviceFee, bookingFee=$bookingFee, travelAllowances=$travelAllowances');

    return CompletedModel(
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
      serviceFee: serviceFee,
      bookingFee: bookingFee,
      travelAllowances: travelAllowances,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingID': bookingId,
      'customerName': customerName,
      'deviceDetails': deviceDetails,
      'issue': issue,
      'location': location,
      'bookingStatus': status,
      'addressId': addressId,
      'serviceId': serviceId,
      'technicianID': technicianId,
      'deviceId': deviceId,
      'bookingCostDetails': {
        'serviceCharge': serviceFee,
        'bookingCharge': bookingFee,
        'travelAllowance': travelAllowances,
      },
    };
  }
}