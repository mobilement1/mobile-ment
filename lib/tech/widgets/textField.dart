// import 'package:flutter/material.dart';
// import 'package:mobile_servies/tech/constants/colors.dart';

// Widget searchField({required void Function(String)? onChanged}){
//   return TextFormField(
    
//         style: const TextStyle(color: Colors.white),  
//         decoration: InputDecoration(
//           hintText: 'Search by ID, name or device...',
//           hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
//           prefixIcon: const Icon(Icons.search, color: Colors.white70),
//           filled: true,
//           fillColor: Colors.white.withOpacity(0.2),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: AppColors.appBarMobileTitle),
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 14),
//         ),
      
//   );
// }

// tech/widgets/textField.dart
import 'package:flutter/material.dart';

Widget searchField({required void Function(String)? onChanged}) {
  return TextField(
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: 'Search tasks...',
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      prefixIcon: Icon(Icons.search, color: Colors.grey),
    ),
    style: TextStyle(color: Colors.black),
  );
}