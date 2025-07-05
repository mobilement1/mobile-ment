class CompletedOrder {
  final String id;
  final String? customerName;
  final String? device;
  final String? issue;
  final DateTime? date;
  final String? location;
  final double? amount;
  final String? service;
  final String status;

  CompletedOrder({
    required this.id,
    this.customerName,
    this.device,
    this.issue,
    this.date,
    this.location,
    this.amount,
    this.service,
    required this.status,
  });

  factory CompletedOrder.fromJson(Map<String, dynamic> json) {
    return CompletedOrder(
      id: json['bookingID'] ?? '', 
      customerName: json['customerName'] ?? json['customer']?['name'] ?? 'Unknown',
      device: json['deviceName'] ?? json['deviceModel'] ?? 'Unknown', 
      issue: json['issue'] ?? json['problemDescription'] ?? 'Unknown',
      date: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null, 
      location: json['street'] != null
          ? '${json['street']}, ${json['city']}, ${json['pincode']}' 
          : json['address'] ?? 'Unknown',
      amount: json['bookingCostDetails']?['totalBookingCost']?.toDouble() ??
          json['amount']?.toDouble() ??
          0.0, 
      service: json['serviceName'] ?? json['serviceType'] ?? 'Unknown', 
      status: json['bookingStatus'] ?? 'Completed', 
    );
  }
}