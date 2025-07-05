class UserDetailsModel {
  final String name;
  
  final String role;

  UserDetailsModel({required this.name,  required this.role,});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      name: json['name'] ?? '',
      
      role: json['role'] ?? '', 
      
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    
    'role': role,
  };
}
