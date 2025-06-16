class ServiceBookingModel {
  final String serviceId;
  final String serviceName;

  ServiceBookingModel({required this.serviceId, required this.serviceName});

  factory ServiceBookingModel.fromJson(Map<String, dynamic> json) {
    return ServiceBookingModel(
      serviceId: json['serviceID']??'',
      serviceName: json['serviceName']??'',
    );
  }
}