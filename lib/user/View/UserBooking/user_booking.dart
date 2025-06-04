import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBooking/bookingDettail.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
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
      
      body: Stack(
        children: [
          Positioned(
           top: 60,
                  left: 20,
                    child:AppLogo(),),
          Column(
            children: [
              
              const Gap(150), // Space at the top with green background
              containers(
                
                   SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              TextConstants.deviceSer,
                              style: GoogleFonts.poppins(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2E2E2E),
                                letterSpacing: 0.5,
                                shadows: [
                                  Shadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: const Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              TextConstants.serviceHis,
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF718355),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          const Gap(10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: bookings.length,
                            itemBuilder: (context, index) {
                              final booking = bookings[index];
                              return Card(
                                color:Color(0xFFE9F5DB)


,
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(15),
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
                                        Row(
                                          children: [
                                            icon(Icons.devices, Colors.green),
                                            const Gap(10),
                                            Text(
                                              "Device: ${booking['device']}",
                                              style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color:const Color.fromARGB(255, 111, 111, 111),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(8),
                                        Row(
                                          children: [
                                            icon(Icons.build, Colors.green),
                                            const Gap(10),
                                            Text(
                                              "Service: ${booking['service']}",
                                              style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromARGB(255, 111, 111, 111),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(8),
                                        Row(
                                          children: [
                                            icon(Icons.person, Colors.green),
                                            const Gap(10),
                                            Text(
                                              "Technician: ${booking['technician']}",
                                              style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromARGB(255, 111, 111, 111),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),
                  ),
                ),
              
            ],
          ),
        ],
      ),
    );
  }
}
