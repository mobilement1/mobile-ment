class SimpleValidator {
  static String? validateName(String value) {
    if (value.isEmpty) return 'Name is required';
    if (value.length < 3) return 'Name must be at least 3 characters';
    if (value.contains(RegExp(r'[0-9]'))) return 'Name should not contain numbers';
    return null;
  }

  static String? validateUsername(String value) {
    if (value.isEmpty) return 'Username is required';
    if (value.length < 3) return 'Username must be at least 3 characters';
    if (value.contains(' ')) return 'Username should not contain spaces';
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) return 'Phone number is required';
    if (value.length != 10) return 'Phone must be 10 digits';
    if (!value.startsWith(RegExp(r'[6-9]'))) return 'Phone must start with 6-9';
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Email is required';
    if (!value.contains('@') || !value.contains('.')) return 'Enter a valid email';
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Password is required';
    if (value.length < 6) return 'Password must be at least 6 characters';
    if (!value.contains(RegExp(r'[A-Z]'))) return 'Must include 1 uppercase letter';
    if (!value.contains(RegExp(r'[a-z]'))) return 'Must include 1 lowercase letter';
    if (!value.contains(RegExp(r'[0-9]'))) return 'Must include 1 number';
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) return 'Must include 1 special character';
    return null;
  }

  static String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return 'Confirm Password is required';
    if (password != confirmPassword) return 'Passwords do not match';
    return null;
  }
}
