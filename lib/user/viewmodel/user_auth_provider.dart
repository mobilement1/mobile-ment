import 'package:flutter/material.dart';
import 'package:mobile_servies/user/UserModel/loginmodel.dart';
import 'package:mobile_servies/user/UserModel/registermodel.dart';
import 'package:mobile_servies/user/UserServices/user_authService.dart';
import 'package:mobile_servies/user/View/UserRegister/validationrgister.dart';

class UserAuthProvider extends ChangeNotifier {
  final UserAuthService _authService = UserAuthService();

  // Controllers for Register
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Controllers for Login
  final loginUserNameController = TextEditingController();
  final loginPasswordController = TextEditingController();

  String errorMessage = '';

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }


  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  bool _isConfirmPasswordHidden = true;
  bool get isConfirmPasswordHidden => _isConfirmPasswordHidden;
  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    notifyListeners();
  }

  /// Clear any error message
  void clearError() {
    if (errorMessage.isNotEmpty) {
      errorMessage = '';
      notifyListeners();
    }
  }

  /// Register User
  Future<String> registerUser(BuildContext context) async {
    final name = nameController.text.trim();
    final username = userNameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    final validations = [
      SimpleValidator.validateName(name),
      SimpleValidator.validateUsername(username),
      SimpleValidator.validatePhone(phone),
      SimpleValidator.validateEmail(email),
      SimpleValidator.validatePassword(password),
      SimpleValidator.validateConfirmPassword(password, confirmPassword),
    ];

    for (final result in validations) {
      if (result != null) {
        errorMessage = result;
        notifyListeners();
        return errorMessage;
      }
    }

    final user = Registermodel(
      name: name,
      userName: username,
      phone: phone,
      email: email,
      password: password,
    );

    final response = await _authService.registerUser(user);
    errorMessage = response == "success" ? '' : response;
    notifyListeners();
    return response;
  }

  /// Login User
  Future<String> loginUser(BuildContext context) async {
    final username = loginUserNameController.text.trim();
    final password = loginPasswordController.text;

    final validations = [
      SimpleValidator.validateUsername(username),
      SimpleValidator.validatePassword(password),
    ];

    for (final result in validations) {
      if (result != null) {
        errorMessage = result;
        notifyListeners();
        return errorMessage;
      }
    }

    final user = LoginModel(userName: username, password: password);
    final response = await _authService.loginUser(user);

    errorMessage = response == "success" ? '' : response;
    notifyListeners();
    return response;
  }

  /// Get stored token
  Future<String?> getUserToken() async {
    return await _authService.getToken();
  }

  /// Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    final token = await _authService.getToken();
    return token != null;
  }

  /// Logout
  Future<void> logoutUser() async {
    await _authService.logout();
    clearAllFields();
    notifyListeners();
  }

  /// Clear all controllers and state
  void clearAllFields() {
    nameController.clear();
    userNameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    loginUserNameController.clear();
    loginPasswordController.clear();
    errorMessage = '';
    notifyListeners();
  }
}
