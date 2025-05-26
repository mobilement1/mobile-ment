
import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';

Widget colorContainers([ IconData? icon, String? count, String? text,Color? color,Color? containerClr]) {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: Container(
      height: 130,
      width: 150,
      decoration: BoxDecoration(
         gradient: const LinearGradient(
            colors: [AppColors.justSample, AppColors.darkBluePurple],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
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
                color: containerClr,
                borderRadius: BorderRadius.circular(15),  
              ),
              child: Icon(icon, color: color, size: 35),
            ),

            const SizedBox(height: 8),
            Text(
              count ?? '',
              style: const TextStyle(color: AppColors.whiteClr, fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              text ?? '',
              style: const TextStyle(color: AppColors.whiteClr,fontSize: 18,fontWeight:FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
