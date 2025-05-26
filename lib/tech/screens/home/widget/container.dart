import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';

Widget homeContainers([IconData? icon, textContainer, textMain]) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: Container(
        height: 175,
        width: 180,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
          gradient: const LinearGradient(
            colors: [AppColors.justSample, AppColors.darkBluePurple],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: const Color(0x3061DAFB),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: AppColors.appBarMobileTitle,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                textContainer ?? "",
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                textMain ?? "",
                style: const TextStyle(
                  color: AppColors.whiteClr,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
