import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/model/complete_model.dart';
import 'package:mobile_servies/tech/widgets/profile_widgets.dart';

void viewDialog(BuildContext context, CompletedModel task) {
  log('Displaying task: serviceFee=${task.serviceFee}, bookingFee=${task.bookingFee}, travelAllowances=${task.travelAllowances}');
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color.fromARGB(255, 85, 105, 53),
      title: Row(
        children: [
          Text(
            "Service Request Details",
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteClr, fontSize: 20),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 145, 58),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    task.status,
                    style: const TextStyle(color: AppColors.whiteClr),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            _buildSection(
              icon: Icons.assignment_outlined,
              title: "Service Details",
              content: Column(
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Customer", style: TextStyle(color: AppColors.grey)),
                      Text("Device", style: TextStyle(color: AppColors.grey)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(task.customerName, style: const TextStyle(color: Colors.white)),
                      Text(task.deviceDetails, style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Issue", style: TextStyle(color: AppColors.grey)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(task.issue, style: const TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildSection(
              icon: Icons.attach_money,
              title: "Cost Summary",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _costRow("Service Fee:", task.serviceFee == 0.0 ? "N/A" : "₹${task.serviceFee.toStringAsFixed(2)}"),
                  _costRow("Booking Fee:", task.bookingFee == 0.0 ? "N/A" : "₹${task.bookingFee.toStringAsFixed(2)}"),
                  _costRow("Travel Allowances:", task.travelAllowances == 0.0 ? "N/A" : "₹${task.travelAllowances.toStringAsFixed(2)}"),
                  const Divider(color: Colors.white54),
                  _costRow(
                    "Total",
                    (task.serviceFee + task.bookingFee + task.travelAllowances) == 0.0
                        ? "N/A"
                        : "₹${(task.serviceFee + task.bookingFee + task.travelAllowances).toStringAsFixed(2)}",
                    isBold: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  );
}

Widget _buildSection({
  required IconData icon,
  required String title,
  required Widget content,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(255, 255, 255, 0.05),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.grey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rowWithText(txt: title, icn: icon),
        content,
      ],
    ),
  );
}

class _costRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const _costRow(this.label, this.value, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Colors.white,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}