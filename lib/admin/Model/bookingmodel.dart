class Booking {
  final String customerName;
  final String service;
  final String date;
  final double amount;
  final String status;

  Booking({
    required this.customerName,
    required this.service,
    required this.date,
    required this.amount,
    required this.status,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      customerName: json['customerName'] ?? 'Unknown',
      service: json['service'] ?? 'Unknown Service',
      date: json['date'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? 'Pending',
    );
  }
}
