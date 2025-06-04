import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/View/UserDevice/devicewidget.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

class UserDevice extends StatelessWidget {
  const UserDevice({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  TextConstants.ourDevices,
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
                          const Gap(8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              TextConstants.urservice1,
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF5A5A5A),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          const Gap(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: 'Search Devices',
                                hintStyle: GoogleFonts.openSans(
                                  color: const Color(0xFF8D8D8D),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
                                ),
                                prefixIcon: icon(Icons.search, const Color(0xFF5A5A5A)),
                              ),
                              style: GoogleFonts.openSans(
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Available Devices",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              "Select a device to view details",
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF5A5A5A),
                              ),
                            ),
                          ),
                        
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Card(
                                color: Color(0xFFE9F5DB),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              icon(Icons.phone_iphone, Colors.green),
                                              const Gap(10),
                                              Text(
                                                'iPhone 13',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color:  const Color.fromARGB(255, 103, 102, 102)
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 255, 255, 255),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Text(
                                              'SmartPhone',
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF718355),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(5),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 40.0),
                                        child: Text(
                                          'Apple',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(255, 103, 102, 102),
                                          ),
                                        ),
                                      ),
                                      const Gap(15),
                                      Row(
                                        children: [
                                          icon(Icons.info, Colors.green),
                                          const Gap(10),
                                          Text(
                                            'Model: A2634',
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(255, 103, 102, 102)
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          icon(Icons.calendar_month, Colors.green),
                                          const Gap(10),
                                          Text(
                                            'Released: 2021',
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(255, 103, 102, 102)
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Gap(20),
                                      Center(
                                        child: customButton(
                                          label: TextConstants.viewDetails,
                                          icon: null,
                                          onPressed: () {
                                            showDeviceDetailDialog(context);
                                          },
                                        ),
                                      ),
                                    ],
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

