import 'dart:developer';

class Device {
  final String deviceId;
  final String deviceName;
  final String brand;
  final String deviceType;
  final String model;
  final int releaseYear;
  final String commonIssues;
  final String repairableComponents;

  Device({
    required this.deviceId,
    required this.deviceName,
    required this.brand,
    required this.deviceType,
    required this.model,
    required this.releaseYear,
    required this.commonIssues,
    required this.repairableComponents,
  });

  factory Device.fromJson(Map<String, dynamic> json) {
    final deviceId = json['deviceID']?.toString() ?? '';
    log('deviceId: $deviceId');
    if (deviceId.isEmpty || !RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$', caseSensitive: false).hasMatch(deviceId)) {
      throw FormatException('Invalid or missing deviceId in JSON: $json');
    }

    return Device(
      deviceId: deviceId,
      deviceName: json['deviceName'] ?? '',
      brand: json['brand'] ?? '',
      deviceType: json['deviceType'] ?? '',
      model: json['model'] ?? '',
      releaseYear: json['releaseYear'] ?? 0,
      commonIssues: json['commonIssues'] ?? '',
      repairableComponents: json['repairableComponents'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'DeviceID': deviceId,
      'DeviceName': deviceName,
      'Brand': brand,
      'DeviceType': deviceType,
      'Model': model,
      'ReleaseYear': releaseYear,
      'CommonIssues': commonIssues,
      'RepairableComponents': repairableComponents,
    };
  }
}