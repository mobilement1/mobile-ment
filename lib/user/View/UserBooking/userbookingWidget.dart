 
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';

Widget rowWidget(String text1, String text2, double gap, {
  Color color = const Color.fromARGB(255, 134, 155, 101),
  double fontSize = 18,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: [
        text(text1, const Color.fromARGB(255, 187, 187, 187), fontSize, FontWeight.bold),
        Gap(gap),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    ),
  );
}



Widget bulletRichText(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: [
        const Icon(Icons.circle, size: 8, color: Colors.black),
        const Gap(10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16),
              children: [
                TextSpan(
                  text: '$label ',
                  style: const TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: value,
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
String formatDateTime(String dateTimeString) {
  try {
    final dateTime = DateTime.parse(dateTimeString);
    return "${_twoDigits(dateTime.day)}-${_twoDigits(dateTime.month)}-${dateTime.year} "
           ;
  } catch (e) {
    return dateTimeString;
  }
}

String _twoDigits(int n) => n.toString().padLeft(2, '0');



