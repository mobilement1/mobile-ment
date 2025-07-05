class Userservicemodel {
  final String serviceId;
  final String serviceName;
  final String description;
  final double price;
  final String duration;
  final String category;
    final bool isPopular;

  Userservicemodel({
    required this.serviceId,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.duration,
    required this.category,
     required this.isPopular,
  });

  factory Userservicemodel.fromJson(Map<String, dynamic> json) {
    return Userservicemodel(
      serviceId: json['serviceId'] ?? '',
      serviceName: json['serviceName'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      duration: json['estimatedTime']?.toString() ?? '',
      category: json['category'] ?? '',
      isPopular: json['isPopular'] ?? false,
    );
  }
}
