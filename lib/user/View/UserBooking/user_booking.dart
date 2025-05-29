import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserBooking/bookingDettail.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';


class UserBooking extends StatelessWidget {
  const UserBooking({super.key});

  final List<Map<String, String>> bookings = const [
    {
      'device': 'S23 Ultra',
      'service': 'Camera Cleaning',
      'date': '5/9/2025',
      'status': 'Assigned',
      'technician': 'Yasar S',
      'payment': 'BookingPaid',
    },
    {
      'device': 'iPhone 13',
      'service': 'Screen Guard Service',
      'date': '5/8/2025',
      'status': 'Assigned',
      'technician': 'Yasar S',
      'payment': 'BookingPaid',
    },
    {
      'device': 'S23 Ultra',
      'service': 'Screen Guard Service',
      'date': '5/8/2025',
      'status': 'Assigned',
      'technician': 'Yasar S',
      'payment': 'BookingPaid',
    },
    {
      'device': 'iPhone 13',
      'service': 'Camera Cleaning',
      'date': '5/8/2025',
      'status': 'Assigned',
      'technician': 'Yasar S',
      'payment': 'BookingPaid',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(children: [
          text(TextConstants.title1, const Color(0xFF61DAFB), 30, FontWeight.bold),
          text(TextConstants.title2, Colors.white, 30, FontWeight.bold),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            text(TextConstants.deviceSer, Colors.white, 25, FontWeight.bold),
            const Gap(20),
            text(TextConstants.serviceHis, Colors.white, 20, FontWeight.normal),
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Card(
                    color: const Color(0x3361DAFB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingDetailPage(booking: booking),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text("Device     : ${booking['device']}", Colors.white, 20, FontWeight.bold),
                            const SizedBox(height: 8),
                            text("Service    : ${booking['service']}", Colors.white70, 16, FontWeight.bold),
                            const SizedBox(height: 8),
                            text("Technician : ${booking['technician']}", Colors.white70, 16, FontWeight.bold),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
