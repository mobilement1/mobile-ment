class TechnicianRequest {
  final String technicianRequestId;
  final String name;
  final String email;
  final String phone;
  final int experience;
  final String specialization;
  final String bio;
  final String place;
  final double longitude;
  final double latitude;
  final String requestDate;
  final String status;
  final String? documentData;
  final String? adminRemark;

  TechnicianRequest({
    required this.technicianRequestId,
    required this.name,
    required this.email,
    required this.phone,
    required this.experience,
    required this.specialization,
    required this.bio,
    required this.place,
    required this.longitude,
    required this.latitude,
    required this.requestDate,
    required this.status,
    this.documentData,
    this.adminRemark,
  });

  factory TechnicianRequest.fromJson(Map<String, dynamic> json) {
    return TechnicianRequest(
      technicianRequestId: json['technicianRequestId'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      experience: json['experience'] ?? 0,
      specialization: json['specialization'] ?? '',
      bio: json['bio'] ?? '',
      place: json['place'] ?? '',
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      requestDate: json['requestDate'] ?? '',
      status: json['status'] ?? 'Pending',
      documentData: json['documentData'],
      adminRemark: json['adminRemark'],
    );
  }
}