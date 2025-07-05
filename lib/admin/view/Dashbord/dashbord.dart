import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/admin/controller/dashboard_provider.dart';
import 'package:mobile_servies/admin/view/Dashbord/flChart_lines.dart';
import 'package:mobile_servies/admin/view/Dashbord/flchart_horizonatal.dart';
import 'package:mobile_servies/admin/view/Dashbord/widject.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/tech/widgets/userIcon.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:provider/provider.dart';

class Dashbordpage extends StatefulWidget {
  const Dashbordpage({super.key});

  @override
  State<Dashbordpage> createState() => _DashbordpageState();
}

class _DashbordpageState extends State<Dashbordpage> with SingleTickerProviderStateMixin {
  final GlobalKey _dashKey = GlobalKey();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdminDashboardProvider>(context, listen: false).fetchDashboardData();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
               Row(
                 children: [
                   Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: AppLogo(),
                                 ),
                                 Spacer(),
                                 UserMenuPopup(),SizedBox(width: 15,),
                 ],
               ),
              _buildTabBar(),
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
                  child: Consumer<AdminDashboardProvider>(
                    builder: (context, provider, _) {
                      return TabBarView(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          buildKeyMetricsTab(provider),
                          buildRevenueTab(provider),
                          buildServiceStatsTab(provider),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          DraggableFabMenu(adminDashboardKey: _dashKey),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedLabelColor: const Color.fromARGB(255, 206, 202, 202),
        indicatorColor: const Color(0xFF718355),
        indicatorWeight: 3,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        tabs: const [
          Tab(text: "Key Metrics"),
          Tab(text: "Revenue"),
          Tab(text: "Service Stats"),
        ],
      ),
    );
  }

  Widget buildKeyMetricsTab(AdminDashboardProvider provider) {
    if (provider.isLoading && provider.metrics == null) {
      return const Center(child: CircularProgressIndicator(color:  Color.fromARGB(255, 85, 105, 53),));
    }

    if (provider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 48),
            const SizedBox(height: 16),
            Text(
              "Error: ${provider.error}",
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => provider.fetchDashboardData(),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }
     if (provider.metrics == null) {
    return const Center(child: Text("No data available"));
  }

    final metrics = provider.metrics!;
    return SingleChildScrollView(
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
                title: "Total\nRevenue",
                value: "\₹ ${(metrics.totalRevenue / 1000).toStringAsFixed(1)}K",
                isPositive: true,
              ),
              const SizedBox(width: 15),
              StatCard(
                icon: Icons.book_online,
                title: "Completed Bookings",
                value: metrics.totalCompletedBookings.toString(),
                isPositive: metrics.totalCompletedBookings > 0,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // StatCard(
              //   icon: Icons.people,
              //   title: "Online Technicians",
              //   value: metrics.activeTechnicians.toString(),
              //   isPositive: true,
              // ),
              // const SizedBox(width: 20),
              StatCard(
                icon: Icons.attach_money,
                title: "Total Profit",
                value: "\₹ ${(metrics.totalProfit).toStringAsFixed(1)}",
                isPositive: metrics.totalProfit > 0,
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}