class BookingModelUser {
  final String addressID;
  final String deviceID;
  final String serviceID;
  final String? technicianID;
  final String issue;

  BookingModelUser({
    required this.addressID,
    required this.deviceID,
    required this.serviceID,
  this.technicianID,
    required this.issue,
  });

  factory BookingModelUser.fromJson(Map<String, dynamic> json) {
    return BookingModelUser(
      addressID: json['addressID'],
      deviceID: json['deviceID'],
      serviceID: json['serviceID'],
      technicianID: json['technicianID'],
      issue: json['issue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressID': addressID,
      'deviceID': deviceID,
      'serviceID': serviceID,
     if (technicianID != null && technicianID!.isNotEmpty)
      'technicianID': technicianID,

      'issue': issue,
    };
  }
}
