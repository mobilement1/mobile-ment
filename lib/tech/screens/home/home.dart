

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/admin/view/Dashbord/widject.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/screens/home/notification.dart';
import 'package:mobile_servies/tech/screens/home/widget/container.dart';
import 'package:mobile_servies/tech/screens/profile/profile_tech.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobile_servies/tech/widgets/barchart.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';

class HomePageTech extends StatelessWidget {
  const HomePageTech({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            const Gap(35),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: mobileMendWdgtWithContainer(),
            ),
            const Gap(30), // Space at the top with green background
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TextConsts.techDashBoard,
                                  style: TextStyle(
                                    color: const Color(0xFF2E2E2E),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                    shadows: [
                                      Shadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: const Offset(2, 2),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  "Manage Bookings, Services, Devices,\nand technicians",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => const NotificationPageTech(),
                                  );
                                },
                                icon: const Icon(
                                  Icons.notifications_none_sharp,
                                  color: Color(0xFF5A5A5A),
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      TabBar(
                        labelColor: const Color(0xFF718355),
                        unselectedLabelColor: const Color(0xFF5A5A5A),
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        unselectedLabelStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        indicatorColor: const Color(0xFF718355),
                        indicatorWeight: 3,
                        tabs: const [
                          Tab(text: "Overview"),
                          Tab(text: "Analytics"),
                        ],
                      ),
                      const Gap(20),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Overview Tab: Four Containers
                            SingleChildScrollView(
                              child: Wrap(
                                spacing: 0,
                                runSpacing: 0,
                                alignment: WrapAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      homeContainers(
                                        Icons.currency_rupee_sharp,
                                        "Total Revenue",
                                        "₹ 8,952",
                                      ),
                                      homeContainers(
                                        Icons.check_circle,
                                        "Completed",
                                        "96",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      homeContainers(
                                        Icons.assignment,
                                        "Assigned",
                                        "100",
                                      ),
                                      homeContainers(
                                        Icons.hourglass_empty,
                                        "In Progress",
                                        "4",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Analytics Tab: Chart
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            TextConsts.revenueAndCompledtedBookings,
                                            style: GoogleFonts.poppins(
                                              fontSize: 22,
                                              color: const Color(0xFF2E2E2E),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Gap(4),
                                          Text(
                                            TextConsts.monthlyRevenueAndbookingCount,
                                            style: GoogleFonts.openSans(
                                              color: const Color(0xFF5A5A5A),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Gap(10),
                                          SizedBox(
                                            height: 380,
                                            child: CustomBarChart(
                                              monthlyData: {
                                                "Jan": {"Revenue": 110, "Completed": 55},
                                                "Feb": {"Revenue": 90, "Completed": 60},
                                                "Mar": {"Revenue": 30, "Completed": 25},
                                                "Apr": {"Revenue": 30, "Completed": 5},
                                              },
                                              colors: [
                                                const Color(0xFF718355),
                                                Colors.blueGrey,
                                              ],
                                              metrics: ["Revenue", "Completed"],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
