import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_servies/user/View/UserBookingSection/showDialogueScrn.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';


class BookRepairPage extends StatefulWidget {
  const BookRepairPage({super.key});

  @override
  State<BookRepairPage> createState() => _BookRepairPageState();
}

class _BookRepairPageState extends State<BookRepairPage> {
  String? selectedDevice;
  String? selectedService;
  String issueDescription = '';

  final devices = ['iPhone 13', 'S23 Ultra', 'iPhone 15', 'F9'];
  final services = [
    'Speaker Replacement',
    'Storage Increase',
    'Screen Guard Service',
    'Camera Cleaning',
    'Charging port Repair',
    'Water Damage',
    'Screen Replacement',
    'Board Change'
  ];
  List<String> savedAddresses = [];
  bool addressAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          const Gap(80), // Space at the top with green background
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
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
                              TextConstants.book1,
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
                          IconButton(
                            icon: icon(Icons.arrow_back, const Color(0xFF5A5A5A)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const Gap(8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: text(TextConstants.convenience, Color(0xFF5A5A5A), 16, FontWeight.w400),
                       
                      ),
                      const Gap(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                        text(TextConstants.selectDevice, Color(0xFF2E2E2E), 22, FontWeight.w600,)
                        
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: buildDropdown(
                          value: selectedDevice,
                          items: devices,
                          hintText: TextConstants.selectDevice,
                          onChanged: (value) {
                            setState(() {
                              selectedDevice = value;
                            });
                          },
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                        text(TextConstants.selectService, Color(0xFF2E2E2E), 22, FontWeight.w600,)
                        
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: buildDropdown(
                          value: selectedService,
                          items: services,
                          hintText: TextConstants.selectService,
                          onChanged: (value) {
                            setState(() {
                              selectedService = value;
                            });
                          },
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                        text(TextConstants.selectAddress, Color(0xFF2E2E2E), 22, FontWeight.w600,)
                         
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                addressAvailable
                                    ? TextConstants.availableAddress
                                    : TextConstants.notAvailableAddress,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: addressAvailable ? const Color(0xFF2E2E2E) : Colors.red,
                                ),
                              ),
                            ),
                            Gap(10),
                            Align(
                              alignment: Alignment.centerRight,
                               child:showAddressDialog(context),
                          
                            ),
                          ],
                        )
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child:
                        text(TextConstants.describe, const Color(0xFF2E2E2E), 22, FontWeight.w600,)
                        
                      ),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          maxLines: 3,
                          style: GoogleFonts.openSans(color: const Color(0xFF2E2E2E)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: TextConstants.describe,
                            hintStyle: GoogleFonts.openSans(color: const Color(0xFF8D8D8D)),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            issueDescription = value;
                          },
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: showScreen(context),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

