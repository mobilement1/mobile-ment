import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Text(
          "$label: ",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2E2E2E),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: const Color(0xFF5A5A5A),
            ),
          ),
        ),
      ],
    ),
  );
}

void showDeviceDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Device Details',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
                 Gap(10),
                detailRow('Brand', 'Samsung'),
                detailRow('Model', 'S23'),
                detailRow('Type', 'Smartphone'),
                detailRow('Release Year', '2024'),
                 Gap(10),
                Text(
                  '⚠ Common Issues',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
                Wrap(
                  spacing: 6,
                  children: [
                    Chip(
                      label: Text(
                        'display',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      backgroundColor: Colors.orange[100],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  '🛠 Repairable Components',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
                Wrap(
                  spacing: 6,
                  children: [
                    Chip(
                      label: Text(
                        'display',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      backgroundColor: Color.fromARGB(255, 218, 243, 179),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    Chip(
                      label: Text(
                        'battery',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      backgroundColor: Color.fromARGB(255, 218, 243, 179),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    Chip(
                      label: Text(
                        'camera',
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      backgroundColor: Color.fromARGB(255, 218, 243, 179),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                ),
                const Gap(10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Close',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF718355),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
