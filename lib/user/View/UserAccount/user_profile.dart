import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserAccount/accountwidget.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
import 'package:mobile_servies/user/view/UserHome/homeHeader.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 60,
              left: 20,
              child: AppLogo()),
          Column(
            children: [
              const Gap(150), // Space at the top with green background
              containers(
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'My Account',
                                style: GoogleFonts.poppins(
                                  fontSize: 38,
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
                          ],
                        ),
                        const Gap(20),
                        Center(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    const AssetImage('asset/prf1.png'),
                                radius: 60,
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF718355),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF718355),
                                      width: 3,
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Text(
                                "Zeenath",
                                style: GoogleFonts.poppins(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2E2E2E),
                                ),
                              ),
                              Text(
                                'zeenathtc961@gmail.com',
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF718355),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            cardWidget("12", "Total Repairs"),
                            Gap(10),
                            cardWidget("2", "Active Orders"),
                          ],
                        ),
                        
                        const Gap(30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Current Repair',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        cardWidgetwo(),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Account Details',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                accountRow(Icons.phone, '7306706964'),
                                const Divider(color: Color(0xFF8D8D8D)),
                                accountRow(
                                    Icons.email, 'zeenathtc961@gmail.com'),
                                const Divider(color: Color(0xFF8D8D8D)),
                                accountRow(
                                    Icons.location_on, 'Malappuram, Kerala'),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Settings',
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Card(
                          color: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                accountRow(Icons.notification_important,
                                    'Notifications'),
                                const Divider(color: Color(0xFF8D8D8D)),
                                accountRow(Icons.settings, 'Settings'),
                                const Divider(color: Color(0xFF8D8D8D)),
                                accountRow(Icons.help, 'About Us'),
                              ],
                            ),
                          ),
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
