class TechnicianProfile {
  final String name;
  final String role;
  final String technicianId;
  final String status;

  TechnicianProfile({
    required this.name,
    required this.role,
    required this.technicianId,
    required this.status,
  });

  factory TechnicianProfile.fromJson(Map<String, dynamic> json) {
    return TechnicianProfile(
      name: json['name'] ?? 'Unknown',
      role: json['role'] ?? 'Unknown',
      technicianId: json['technicianId'] ?? 'Unknown',
      status: json['status'] ?? 'Offline',
    );
  }
}
