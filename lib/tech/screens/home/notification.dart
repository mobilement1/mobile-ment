

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/tech/constants/text.dart';

class NotificationPageTech extends StatelessWidget {
  const NotificationPageTech({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Color(0xFFF5F5F5),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFF8D8D8D),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 2,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(
                      Icons.notifications_active,
                      color: Color(0xFF718355),
                    ),
                    title: Text(
                      'Task ${index + 1}',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF2E2E2E),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      TextConsts.newtaskassignedbyUser,
                      style: GoogleFonts.openSans(
                        color: const Color(0xFF5A5A5A),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}