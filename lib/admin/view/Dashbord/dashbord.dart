import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/admin/view/Dashbord/flChart_lines.dart';
import 'package:mobile_servies/admin/view/Dashbord/flchart_horizonatal.dart';
import 'package:mobile_servies/admin/view/Dashbord/widject.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/admin/widgets.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';

class Dashbordpage extends StatelessWidget {
  Dashbordpage({super.key});
  final GlobalKey _dashKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: AppLogo(),
                ),
                const tabBarWidgetDashboardHome(),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Admin Dashboard",
                                style: GoogleFonts.poppins(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF2E2E2E),
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Manage Bookings, Services, Devices, and Technicians",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF5A5A5A),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Key Metrics",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2E2E2E),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Overview of performance indicators",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF5A5A5A),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StatCard(
                                    icon: Icons.monetization_on,
                                    title: "Revenue",
                                    value: "\$40K",
                                    isPositive: true,
                                  ),
                                  const SizedBox(width: 20),
                                  StatCard(
                                    icon: Icons.book_online,
                                    title: "Bookings",
                                    value: "40",
                                    isPositive: false,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StatCard(
                                    icon: Icons.devices,
                                    title: "Devices",
                                    value: "25",
                                    isPositive: true,
                                  ),
                                  const SizedBox(width: 20),
                                  StatCard(
                                    icon: Icons.people,
                                    title: "Technicians",
                                    value: "12",
                                    isPositive: false,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: buildChartContainer(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Service Statistics",
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2E2E2E),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Most requested services",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF5A5A5A),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const HorizontalBarChart(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            DraggableFabMenu(adminDashboardKey: _dashKey),
          ],
        ),
      ),
    );
  }
}