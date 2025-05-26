import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/screens/profile/widget/profile_widgets.dart';

void viewDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromARGB(255, 54, 54, 89),
      title: const Text(
        "Service Request Details",
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteClr),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Service - a2466d16-6da5-46cc-9e1a-a5d4f94a4d9f",
                    style: const TextStyle(color: AppColors.whiteClr),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 55, 145, 58),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Completed",
                    style: TextStyle(color: AppColors.whiteClr),
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
                    children: const [
                      Text("John", style: TextStyle(color: Colors.white)),
                      Text("iPhone 13", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Issue", style: TextStyle(color: AppColors.grey)),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Camera not clear", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Cost Summary
            _buildSection(
              icon: Icons.attach_money,
              title: "Cost Summary",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 8),
                  _costRow("Service Fee:", "₹399"),
                  _costRow("Booking Fee:", "₹199"),
                  _costRow("Travel Allowances:", "₹42.08"),
                  Divider(color: Colors.white54),
                  _costRow("Total", "₹640.08", isBold: true),
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
