import 'package:flutter/material.dart';

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

  // Status-related getters
  String get statusText => isBlocked ? 'Blocked' : 'Active';

  Color get statusColor => isBlocked ? Colors.red : Colors.green;

  String get experienceText => '$experience years';

  String get jobsCompletedText => '$jobsCompleted jobs';

  factory TechnicianListModel.fromJson(Map<String, dynamic> json) {
    return TechnicianListModel(
      id: json['technicianId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      location: json['place']?.toString() ?? '',
      contactEmail: json['email']?.toString() ?? '',
      contactPhone: json['phone']?.toString() ?? '',
      specialized: json['specialization']?.toString() ?? '',
      experience: json['experience']?.toString() ?? '0',
      rating: json['rating']?.toString() ?? '0',
      jobsCompleted: json['completedJobs']?.toString() ?? '0',
      isBlocked: json['isBlocked'] ?? false,
      pendingJobs: json['pendingJobs'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'technicianId': id,
      'name': name,
      'place': location,
      'email': contactEmail,
      'phone': contactPhone,
      'specialization': specialized,
      'experience': experience,
      'rating': rating,
      'completedJobs': jobsCompleted,
      'isBlocked': isBlocked,
      'pendingJobs': pendingJobs,
    };
  }

  TechnicianListModel copyWith({
    String? id,
    String? name,
    String? location,
    String? contactEmail,
    String? contactPhone,
    String? specialized,
    String? experience,
    String? rating,
    String? jobsCompleted,
    bool? isBlocked,
    int? pendingJobs,
  }) {
    return TechnicianListModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      contactEmail: contactEmail ?? this.contactEmail,
      contactPhone: contactPhone ?? this.contactPhone,
      specialized: specialized ?? this.specialized,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      jobsCompleted: jobsCompleted ?? this.jobsCompleted,
      isBlocked: isBlocked ?? this.isBlocked,
      pendingJobs: pendingJobs ?? this.pendingJobs,
    );
  }
}