class Service {
  final String serviceId;
  final String serviceName;
  final double price;
  final String description;
  final String category;
  final int estimatedTime;
  final bool isPopular;

  Service({
    required this.serviceId,
    required this.serviceName,
    required this.price,
    required this.description,
    required this.category,
    required this.estimatedTime,
    required this.isPopular,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceId: json['serviceID'] as String? ?? '', 
      serviceName: json['serviceName'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      estimatedTime: json['estimatedTime'] as int? ?? 0,
      isPopular: json['isPopular'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceID': serviceId,
      'serviceName': serviceName,
      'price': price,
      'description': description,
      'category': category,
      'estimatedTime': estimatedTime,
      'isPopular': isPopular,
    };
  }
}