import 'package:flutter/material.dart';

Widget buildTextField({
  required String label,
  required TextEditingController controller,
  String? Function(String?)? validator,
  String? hint,
  bool obscureText = false,
  bool? isPasswordHidden,
  VoidCallback? onTogglePassword,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      const SizedBox(height: 6),
      TextFormField(
        controller: controller,
        obscureText: obscureText ? (isPasswordHidden ?? true) : false,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          suffixIcon: obscureText
              ? IconButton(
                  icon: Icon(
                    (isPasswordHidden ?? true) ? Icons.visibility_off : Icons.visibility,
                    color:(isPasswordHidden ?? true) ? Colors.grey : Colors.blue, 
                  ),
                  onPressed: onTogglePassword,
                )
              : null,
        ),
      ),
    ],
  );
}
