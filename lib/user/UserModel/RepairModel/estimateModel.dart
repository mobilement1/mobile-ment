class Estimatemodel {
  final dynamic serviceCharge;
  final dynamic bookingCharge;
  final dynamic travelAllowance;
  final dynamic totalDistance;
  final dynamic totalCost;

  Estimatemodel({
    required this.serviceCharge,
    required this.bookingCharge,
    required this.travelAllowance,
    required this.totalDistance,
    required this.totalCost,
  });

  factory Estimatemodel.fromJson(Map<String, dynamic> json) {
    return Estimatemodel(
      serviceCharge: json['serviceCharge'],
      bookingCharge: json['bookingCharge'],
      travelAllowance: json['travelAllowance'],
      totalDistance: json['totalDistance'],
      totalCost: json['totalCost'],
    );
  }
}
