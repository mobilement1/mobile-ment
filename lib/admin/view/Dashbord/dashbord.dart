import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/admin/view/Dashbord/flChart_lines.dart';
import 'package:mobile_servies/admin/view/Dashbord/flchart_horizonatal.dart';
import 'package:mobile_servies/admin/view/Dashbord/widject.dart';
import 'package:mobile_servies/admin/widgets.dart';
class Dashbordpage extends StatelessWidget {
  const Dashbordpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: const Color(0xFF181850),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                "Mobile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF61DAFB),
                  fontSize: 30,
                ),
              ),
              const Text(
                "Mend",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.white70,
                  size: 26,
                ),
                onPressed: () {
                  // Notification handling
                },
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Admin Dashboard",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              Text(
                "Manage bookings , services, devices, and technicians",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 25),
              // Stats Cards Row
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.attach_money_rounded,
                      title: "Revenue",
                      value: "\$8,942",
                      isPositive: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: StatCard(
                      icon: Icons.shopping_bag_outlined,
                      title: "Bookings",
                      value: "149",
                      isPositive: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.engineering,
                      title: "Technicians",
                      value: "\$8,942",
                      isPositive: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: StatCard(
                      icon: Icons.money,
                      title: "Profit",
                      value: "\$8,942",
                      isPositive: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

        
buildChartContainer(),
              const SizedBox(height: 25),

              // Recent Bookings Section
              const Text(
                "Popular Services",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "Most requested repair services",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF61DAFB).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Container(height: 450,width: double.infinity,decoration: BoxDecoration(),
                  
                  child: HorizontalBarChart()),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
      drawer: AdminDraw(),
    );
  }
}
