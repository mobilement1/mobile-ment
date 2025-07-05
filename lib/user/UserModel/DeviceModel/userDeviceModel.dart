class Userdevicemodel {
  final String deviceId;
  final String deviceName;
  final String brand;
  final String deviceType;
  final String model;
  final int releaseYear;
  final String commonIssues;
  final String repairableComponents;

  Userdevicemodel({
    required this.deviceId,
    required this.deviceName,
    required this.brand,
    required this.deviceType,
    required this.model,
    required this.releaseYear,
    required this.commonIssues,
    required this.repairableComponents,
  });

  factory Userdevicemodel.fromJson(Map<String, dynamic> json) {
    return Userdevicemodel(
      deviceId: json['deviceid'] ?? '',
      deviceName: json['deviceName'] ?? '',
      brand: json['brand'] ?? '',
      deviceType: json['deviceType'] ?? '',
      model: json['model'] ?? '',
      releaseYear: json['releaseYear'] ?? 0,
      commonIssues: json['commonIssues'] ?? '',
      repairableComponents: json['repairableComponents'] ?? '',
    );
  }
}
