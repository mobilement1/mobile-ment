import 'dart:developer';

class UserProfileModel {
  final String name;
  final String role;

  UserProfileModel({
    required this.name,
    required this.role,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    log('ℹ Parsing UserProfileModel from JSON: $json');
    
    final name = json['name']?.toString() ?? 'Unknown';
    final role = json['role']?.toString() ?? 'User';
   

    log('ℹ Parsed values: name=$name, role=$role');

    return UserProfileModel(
      name: name,
      role: role,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
    };
  }
}