import 'package:flutter/material.dart';

class ColorStyle {
  static const black=Colors.black;
  static const blue=Colors.blue;
  static const white=Colors.white;
  static final containerColor= const Color.fromARGB(51, 18, 47, 55);
static const textPrimary = Color(0xFF2E2E2E);
  static const textSecondary = Color(0xFF5A5A5A);
 static const gradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF667C51),
      Color(0xFF718355),
      Color(0xFF8B9D7A),
    ],
    stops: [0.0, 0.5, 1.0],
  );

  static var neumorphicCardDecoration = BoxDecoration(
    color: const Color(0xFFF6F7F8),
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Color(0x1A000000),
        blurRadius: 10,
        offset: Offset(2, 2),
      ),
      BoxShadow(
        color: Colors.white,
        blurRadius: 10,
        offset: Offset(-2, -2),
      ),
    ],
  );

  static const mainContentDecoration = BoxDecoration(
    color: Color(0xFFF6F7F8),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(32),
      topRight: Radius.circular(32),
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0x1A000000),
        blurRadius: 20,
        offset: Offset(0, -5),
      ),
    ],
  );

  

}