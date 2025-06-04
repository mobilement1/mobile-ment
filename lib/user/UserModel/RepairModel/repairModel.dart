class BookingModel {
  final String addressID;
  final String deviceID;
  final String serviceID;
  final String technicianID;
  final String issue;

  BookingModel({
    required this.addressID,
    required this.deviceID,
    required this.serviceID,
    required this.technicianID,
    required this.issue,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
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
      'technicianID': technicianID,
      'issue': issue,
    };
  }
}
