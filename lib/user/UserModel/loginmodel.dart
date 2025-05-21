class LoginModel {
  final String userName;
  final String password;

  LoginModel({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "password": password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userName: json["userName"] ?? '',
      password: json["password"] ?? '',
    );
  }
}
