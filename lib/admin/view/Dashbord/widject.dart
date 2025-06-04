
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget StatCard({
  required IconData icon,
  required String title,
  required String value,
  required bool isPositive,
}) {
  return Container(
    height: 160,
    width: 150,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors:
             [const Color(0xFF97A97C), const Color(0xFF718355)]
            
      ),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(0, 4),
          blurRadius: 8,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget BookingCard({
  required String customerName,
  required String service,
  required String date,
  required double amount,
  required String status,
  bool isCompleted = true,
  bool isScheduled = false,
}) {
  Color statusColor;
  if (isCompleted) {
    statusColor = const Color(0xFF4CAF50); // Green for completed
  } else if (isScheduled) {
    statusColor = const Color(0xFFFFA726); // Orange for scheduled
  } else {
    statusColor = const Color(0xFFEF5350); // Red for pending/canceled
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 6,
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.settings_backup_restore_outlined,
            color: statusColor,
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                customerName,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2E2E2E),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                service,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF5A5A5A),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF8D8D8D),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "\$${amount.toStringAsFixed(2)}",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2E2E2E),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                status,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// Tab bar widget


class tabBarWidgetDashboardHome extends StatelessWidget {
  const tabBarWidgetDashboardHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Added padding
      child: TabBar(
        labelColor: const Color(0xFF2E2E2E),
        unselectedLabelColor: const Color.fromARGB(255, 255, 255, 255),
        indicatorColor: const Color(0xFF718355),
        indicatorWeight: 3,
        labelStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(text: "Key Metrics"),
          Tab(text: "Revenue & Bookings"),
          Tab(text: "Service Statistics"),
        ],
      ),
    );
  }
}



// Mobile mend container


class mobileMendWdgtWithContainer extends StatelessWidget {
  const mobileMendWdgtWithContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MobileMend',
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Color(0xFF2E2E2E),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(    'Quick mobile repairs at your doorstep.',
            style: GoogleFonts.ubuntu(
              fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black54
            ),
            )
          ],
        ),
      ),
      
    );
  }
}
