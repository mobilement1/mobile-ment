class BookingModelUser {
  final String addressID;
  final String deviceID;
  final String serviceID;
  final String? technicianID;
  final String issue;
   String?status;
   String? payment;
    String? date;
   String?device;
   String? service;
   String? technician;
   String? customerName;
  String? email;
  String? phone;
  String? street;
  String? city;
  String? pincode;
 BookingCostDetails? costDetails; 
  BookingModelUser({
    required this.addressID,
    required this.deviceID,
    required this.serviceID,
  this.technicianID,
    required this.issue,
    this.status,
    this.payment,
   this.date,
    this.device,
    this.service,
    this.technician,
    this.customerName,
    this.email,
    this.phone,
    this.street,
    this.city,
    this.pincode,
     this.costDetails,
    
  });

  factory BookingModelUser.fromJson(Map<String, dynamic> json) {
    return BookingModelUser(
      addressID: json['addressID']??'',
      deviceID: json['deviceID']??'',
      serviceID: json['serviceID']??'',
      technicianID: json['technicianId'],
      issue: json['issue'],
      status: json['bookingStatus'],
      payment: json['paymentStatus'],
      date: json['createdAt'],
      device: json['deviceName'],
      service: json['serviceName'],
      technician: json['technicianName'],
      customerName: json['customerName'],
      email: json['email'],
      phone: json['phone'],
      street: json['street'],
      city: json['city'],
      pincode: json['pincode'],
     costDetails: json['bookingCostDetails'] != null
          ? BookingCostDetails.fromJson(json['bookingCostDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressID': addressID,
      'deviceID': deviceID,
      'serviceID': serviceID,
     if (technicianID != null && technicianID!.isNotEmpty)
      'technicianId': technicianID,
         
      'issue': issue,
    };
  }


  
}
class BookingCostDetails {
  final double bookingCharge;
  final double travelAllowance;
  final double serviceCharge;
  final double totalBookingCost;

  BookingCostDetails({
    required this.bookingCharge,
    required this.travelAllowance,
    required this.serviceCharge,
    required this.totalBookingCost,
  });

  factory BookingCostDetails.fromJson(Map<String, dynamic> json) {
    return BookingCostDetails(
      bookingCharge: (json['bookingCharge'] ?? 0).toDouble(),
      travelAllowance: (json['travelAllowance'] ?? 0).toDouble(),
      serviceCharge: (json['serviceCharge'] ?? 0).toDouble(),
      totalBookingCost: (json['totalBookingCost'] ?? 0).toDouble(),
    );
  }
}

