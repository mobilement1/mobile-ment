class TechnicianApplication {
    
  final int experience;
  final String resumePath;
  final String specialization;
  final String bio;
  final String place;
  final double longitude;
  final double latitude;

  TechnicianApplication({
    required this.experience,
    required this.resumePath,
    required this.specialization,
    required this.bio,
    required this.place,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'experience': experience,
      'resume': resumePath,
      'specialization': specialization,
      'bio': bio,
      'place': place,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}