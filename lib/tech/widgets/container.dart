
import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';

Widget colorContainers([ IconData? icon, String? count, String? text,Color? color,Color? containerClr]) {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: Container(
      height: 140,
      width: 170,
      decoration: BoxDecoration(
         gradient: const LinearGradient(
            colors: [Color(0xFF718355),Color(0xFF718355)],
            begin: Alignment.topLeft,
    end: Alignment.bottomRight,
          ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 85, 105, 53),
                borderRadius: BorderRadius.circular(15),  
              ),
              child: Icon(icon, color: Colors.white, size: 35),
            ), 

            const SizedBox(height: 8),
            Text(
              count ?? '',
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              text ?? '',
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight:FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
