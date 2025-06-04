import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';

Widget showScreen(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: customButton(
      label: TextConstants.proceed,
      icon: Icons.arrow_forward,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              insetPadding: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      'Select Technician\n (Auto/Manual)',
                      const Color(0xFF2E2E2E),
                      22,
                      FontWeight.w600,
                    ),
                    const Gap(16),
                    Align(
                      alignment: Alignment.center,
                      child: Card(
                        color: Color(0xFFE9F5DB),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              icon(Icons.person, Colors.green),
                              const Gap(5),
                              text(
                                'Select technician automatically',
                                Color.fromARGB(255, 111, 111, 111),
                                16,
                                FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    text(
                      'Best Nearest Technicians',
                      const Color(0xFF2E2E2E),
                      20,
                      FontWeight.w600,
                    ),
                    Card(
                      color: Color(0xFFE9F5DB),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text(
                              'Yasar S',
                              const Color(0xFF2E2E2E),
                              20,
                              FontWeight.w600,
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                icon(Icons.home_repair_service, Colors.green),
                                const Gap(10),
                                text(
                                  'Experience: 4',
                                  Color.fromARGB(255, 111, 111, 111),
                                  16,
                                  FontWeight.w400,
                                ),
                              ],
                            ),
                            const Gap(5),
                            Row(
                              children: [
                                icon(Icons.build, Colors.green),
                                const Gap(10),
                                Expanded(
                                  child: text(
                                    'Specialization: Smartphone, Camera, TV',
                                    Color.fromARGB(255, 111, 111, 111),
                                    16,
                                    FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const Gap(5),
                            Row(
                              children: [
                                icon(Icons.task, Colors.green),
                                const Gap(10),
                                text(
                                  'Jobs Completed: 1',
                                  Color.fromARGB(255, 111, 111, 111),
                                  16,
                                  FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        customButton(
                          label: 'Cancel',
                          icon: null,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        customButton(
                          label: 'Proceed',
                          icon: Icons.arrow_forward,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  insetPadding: const EdgeInsets.all(8),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        text(
                                          'Booking Estimate',
                                          const Color(0xFF2E2E2E),
                                          22,
                                          FontWeight.w600,
                                        ),
                                        const Gap(20),
                                        text(
                                          'Booking Charge: ₹199',
                                          const Color(0xFF5A5A5A),
                                          16,
                                          FontWeight.w400,
                                        ),
                                        const Gap(5),
                                        text(
                                          'Service Charge: ₹2499',
                                          const Color(0xFF5A5A5A),
                                          16,
                                          FontWeight.w400,
                                        ),
                                        const Gap(5),
                                        text(
                                          'Travel Allowance: ₹144.4',
                                          const Color(0xFF5A5A5A),
                                          16,
                                          FontWeight.w400,
                                        ),
                                        const Gap(5),
                                        text(
                                          'Total Distance: 7.2 km',
                                          const Color(0xFF5A5A5A),
                                          16,
                                          FontWeight.w400,
                                        ),
                                        const Gap(10),
                                        text(
                                          'Total Cost: ₹2842.4',
                                          const Color(0xFF2E2E2E),
                                          18,
                                          FontWeight.w600,
                                        ),
                                        const Gap(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            customButton(
                                              label: 'Cancel',
                                              icon: null,
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            customButton(
                                              label: 'Pay Now',
                                              icon: Icons.arrow_forward,
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
