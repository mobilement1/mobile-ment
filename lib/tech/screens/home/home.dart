import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/controller/providers/dashboard_provider.dart';
import 'package:mobile_servies/tech/screens/home/notification.dart';
import 'package:mobile_servies/tech/screens/home/widget/container.dart';

import 'package:mobile_servies/tech/widgets/barchart.dart';
import 'package:mobile_servies/tech/widgets/userIcon.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:provider/provider.dart';

class HomePageTech extends StatefulWidget {
  const HomePageTech({super.key});

  @override
  _HomePageTechState createState() => _HomePageTechState();
}

class _HomePageTechState extends State<HomePageTech> {
  @override
  void initState() {
    super.initState();
   
     WidgetsBinding.instance.addPostFrameCallback((_) {
  Provider.of<DashboardProvider>(context, listen: false).fetchDashboardData();
});


  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(70),
             Row(
               children: [
                 Padding(
                  padding: EdgeInsets.all(12.0),
                  child: AppLogo(),
                             ),
                           Spacer(),
                           UserMenuPopup(),SizedBox(width: 15,),
               ],
             ),
            const Gap(40),
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
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                      const Gap(30),
                      Expanded(
                        child: Consumer<DashboardProvider>(
                          builder: (context, provider, child) {
                            if (provider.isLoading) {
                              return const Center(child:  CircularProgressIndicator(color:  Color.fromARGB(255, 85, 105, 53)));
                            }
                            if (provider.error != null) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Error: ${provider.error}',
                                      style: const TextStyle(color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Gap(10),
                                    ElevatedButton(
                                      onPressed: () => provider.fetchDashboardData(),
                                      child: const Text('Retry'),
                                    ),
                                  ],
                                ),
                              );
                            }
                           if (provider.dashboardData == null) {
                              return const Center(child: Text('No data available'));
                            }

                            final monthlyData = {
                              for (var item in provider.dashboardData!.chartData)
                                item['month'] as String: {
                                  'Revenue': (item['revenue'] as num?)?.toDouble() ?? 0.0,
                                  'Completed': (item['bookings'] as num?)?.toDouble() ?? 0.0,
                                },
                            };
                            log('📊 Chart Data: $monthlyData');
                            log('📈 Dashboard Data: ${provider.dashboardData!.toJson()}');
                            return TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          homeContainers(
                                            Icons.currency_rupee_sharp,
                                            "Total Revenue",
                                            "${provider.dashboardData!.totalRevenue.toStringAsFixed(2)}",
                                          ),
                                          homeContainers(
                                            Icons.check_circle,
                                            "Completed",
                                            "${provider.dashboardData!.completedBookings}",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          homeContainers(
                                            Icons.assignment,
                                            "Assigned",
                                            "${provider.dashboardData!.assignedBookings}",
                                          ),
                                          homeContainers(
                                            Icons.hourglass_empty,
                                            "In Progress",
                                            "${provider.dashboardData!.inProgressBookings}",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
                                                  color: const Color.fromARGB(255, 255, 255, 255),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Gap(20),
                                              SizedBox(
                                                height: 380,
                                                child: CustomBarChart(
                                                  monthlyData: monthlyData,
                                                  colors: const [
                                                    Color(0xFF718355),
                                                    Colors.blueGrey,
                                                  ],
                                                  metrics: const ["Revenue", "Completed"],
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
                            );
                          },
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