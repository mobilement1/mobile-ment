class TechnicianListModel {
  final String id;
  final String name;
  final String location;
  final String contactEmail;
  final String contactPhone;
  final String specialized;
  final String experience;
  final String rating;
  final String jobsCompleted;
  final bool isBlocked; 
  final int pendingJobs;


  TechnicianListModel({
    required this.id,
    required this.name,
    required this.location,
    required this.contactEmail,
    required this.contactPhone,
    required this.specialized,
    required this.experience,
    required this.rating,
    required this.jobsCompleted,
    required this.isBlocked,
    required this.pendingJobs,
  });

  factory TechnicianListModel.fromJson(Map<String, dynamic> json) {
    return TechnicianListModel(
      id: json['technicianId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      location: json['place']?.toString() ?? '', 
      contactEmail: json['email']?.toString() ?? '', 
      contactPhone: json['phone']?.toString() ?? '', 
      specialized: json['specialization']?.toString() ?? '', 
      experience: json['experience']?.toString() ?? '',
      rating: json['rating']?.toString() ?? '0',
      jobsCompleted: json['completedJobs']?.toString() ?? '0',
      isBlocked: json['isBlocked'] ?? false, 
      pendingJobs: json['pendingJobs'] ?? 0, 
    );
  }
}