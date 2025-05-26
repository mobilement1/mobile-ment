import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';

Widget searchField(){
  return TextFormField(
    
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search by ID, name or device...',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          prefixIcon: const Icon(Icons.search, color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.appBarMobileTitle),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      
  );
}