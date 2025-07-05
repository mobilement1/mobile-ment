
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/loginmodel.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/registermodel.dart';
import 'package:mobile_servies/user/UserModel/AuthModel/userDetails.dart';
import 'package:mobile_servies/user/UserServices/AuthService/user_authService.dart';
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
 UserDetailsModel?userDetails;
  String errorMessage = '';
  String successMessage = ''; 
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  bool isPasswordHidden = true;
 
  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  bool isConfirmPasswordHidden = true;
 
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    notifyListeners();
  }

  /// Clear any error message
  void clearMessages() {
    errorMessage = '';
    successMessage = '';
    notifyListeners();
  }

  String?userRole;
  bool isAdmin=false;
  bool isTechnician=false;
//Register User
Future<String> registerUser(BuildContext context) async {
  try {
    setLoading(true);
    clearMessages();

    final name = nameController.text.trim();
    final username = userNameController.text.trim();
    final phone = phoneController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

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
    log("registerUser response: $response");
if (response.toLowerCase().contains("registration successful")) {
  successMessage = response; // show full message in UI
  return "success";
}

   
     else {
      errorMessage = response;
      return errorMessage;
    }
  } catch (e) {
    errorMessage = "Something went wrong: $e";
    return errorMessage;
  } finally {
    setLoading(false); // ✅ ensures loading spinner stops
    notifyListeners(); // ✅ updates the UI
  }
}


  
  /// Login User
  Future<String> loginUser(BuildContext context) async {
    setLoading(true);
    clearMessages();
    final username = loginUserNameController.text.trim();
    final password = loginPasswordController.text.trim();

    final validations = [
      SimpleValidator.validateUsername(username),
      SimpleValidator.validatePassword(password),
    ];

    for (final result in validations) {
      if (result != null) {
        errorMessage = result;
        setLoading(false);
            notifyListeners();
        return errorMessage;
      }
    }

    final user = LoginModel(userName: username, password: password);
    final response = await _authService.loginUser(user);

   if (response == "success") {
     
      successMessage = 'Login Successful!';
      errorMessage = '';
      await fetchUserDetailsAgain();
      userRole=await _authService.getUserRole();
      isAdmin=userRole=='Admin';
      isTechnician=userRole=='Technician';
      
      
    } else {
      errorMessage = response;
      successMessage = '';
      isAdmin=false;
    }
    setLoading(false);

    notifyListeners();
    
    return response;
  }
  
Future<void> loadAllUserInfo() async {
  await fetchUserDetailsAgain(); 
  userRole = await _authService.getUserRole();
  isAdmin = userRole == 'Admin';
  isTechnician=userRole=='Technician';
  notifyListeners();
}


//
  Future<void>fetchUserDetailsAgain()async{
    final data=await _authService.getUserDetails();
    if (data !=null) {
      userDetails=UserDetailsModel.fromJson(data);
      userRole=userDetails?.role;
      log("✅ Name: ${userDetails?.name}");
      log("Role:${userDetails?.role}");
      notifyListeners();
    }else{
      log("❌ User details not available.");
    }
  }

  /// Fetch user profile details from API
Future<Map<String, dynamic>?> getUserDetailsPro() async {
  return await _authService.getUserDetails();
  
}


  /// Get stored token
  Future<String?> getUserToken() async {
    return await _authService.getToken();
  }

  /// Check if user is logged in
  Future<bool> isUserLoggedIn() async {
    final token = await _authService.getToken();
    return token != null&&token.isNotEmpty;
  }

  /// Logout
  Future<void> logoutUser() async {
    await _authService.logout();
    clearAllFields();
    isAdmin=false;
    isTechnician=false;
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
      successMessage = '';
      isAdmin=false;
      userDetails=null;
    notifyListeners();
  }

  void disposeControllers() {
  nameController.dispose();
  userNameController.dispose();
  phoneController.dispose();
  emailController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
  loginUserNameController.dispose();
  loginPasswordController.dispose();
}

}
