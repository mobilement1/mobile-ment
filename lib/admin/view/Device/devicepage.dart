import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Booking/bookingpage.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/admin/view/Servicess/addservice.dart';
import 'package:mobile_servies/admin/view/Servicess/service.dart';
import 'package:mobile_servies/admin/view/Technicianrequst/techniciarequst.dart';
import 'package:mobile_servies/admin/view/Technicians/techician.dart';

class Devicepage extends StatefulWidget {
  const Devicepage({super.key});

  @override
  State<Devicepage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Devicepage> {
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
                  const Text(
                    "Admin Dashboard",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              const Text(
                "Manage bookings , services, devices, and technicians",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Services Management",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Addservicepage()));
                      },
                      child: Text(
                        "Add Service",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 30),
              _buildBookingCard(
                  customerName: 'jon',
                  service: 'water Damage',
                  date: '12/5/2025',
                  amount: 999,
                  status: 'Yes',
                  bookingid: '123242342354534524')
            ],
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF1E1E2E),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          children: [
            Text(
              "Admin Dashboard",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.white),
              title: Text("Dashboard", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashbordpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.book_online, color: Colors.white),
              title: Text("Booking", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Bookingpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.build, color: Colors.white),
              title: Text("Services", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Servicepage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.devices, color: Colors.white),
              title: Text("Devices", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Devicepage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.engineering, color: Colors.white),
              title: Text("Technicians", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Techicianpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.white),
              title: Text("Completed Orders",
                  style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.engineering, color: Colors.white),
              title: Text("Technician Requests",
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Techniciarequstpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text("Logout", style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingCard({
    required String bookingid,
    required String customerName,
    required String service,
    required String date,
    required double amount,
    required String status,
    bool isCompleted = true,
    bool isScheduled = false,
  }) {
    Color statusColor;
    if (isCompleted) {
      statusColor = const Color(0xFF4CAF50); // Green
    } else if (isScheduled) {
      statusColor = const Color(0xFFFFA726); // Orange
    } else {
      statusColor = const Color(0xFF61DAFB); // Cyan
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF282845),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.settings_backup_restore_outlined,
              color: statusColor,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  service,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.remove_red_eye, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF1E1E2E),
                  title: const Text(
                    "Booking Details",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Text(
                    "Customer: $customerName\nService: $service\nDate: $date\nAmount: \$${amount.toStringAsFixed(2)}\nStatus: $status",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Close",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
