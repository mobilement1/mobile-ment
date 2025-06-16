class DeviceBookingModel {
  final String deviceId;
  final String deviceName;

  DeviceBookingModel({required this.deviceId, required this.deviceName});

  factory DeviceBookingModel.fromJson(Map<String, dynamic> json) {
    return DeviceBookingModel(
      deviceId: json['deviceID']??'',
      deviceName: json['deviceName']??'',
    );
  }
}
