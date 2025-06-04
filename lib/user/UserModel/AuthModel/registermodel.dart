class Registermodel {
  final String name;
  final String userName;
  final String phone;
  final String email;
  final String password;

  Registermodel({
    required this.name,
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "userName": userName,
      "phone": phone,
      "email": email,
      "password": password,
    };
  }

  factory Registermodel.fromJson(Map<String, dynamic> json) {
    return Registermodel(
      name: json["name"] ?? '',
      userName: json["userName"] ?? '',
      phone: json["phone"] ?? '',
      email: json["email"] ?? '',
      password: json["password"] ?? '',
    );
  }
}
