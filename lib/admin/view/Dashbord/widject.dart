import 'package:flutter/material.dart';

final ButtonStyle whiteButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color.fromARGB(255, 213, 207, 207),
  foregroundColor: Colors.black,
  fixedSize: Size(150, 40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Colors.black12),
  ),
);
Widget buildRevenueCard({required String title, required String amount}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          amount,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
