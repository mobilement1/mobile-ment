import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/admin/widgets.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';

class Techicianpage extends StatelessWidget {
  Techicianpage({super.key});

  final GlobalKey _technicianKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  AppLogo(),
                  const SizedBox(height: 30),
                  const Text(
                    "Technicians",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  const Text(
                    "Manage bookings, services, devices, and technicians",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Technicians Management",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  buildTechnicianCard(
                    context: context,
                    id: '10119757-0fad-11f1-893f-4567899876cvb',
                    name: 'John Anderson',
                    location: 'Calicut',
                    contactEmail: 'john@gmail.com',
                    contactPhone: '7984674746',
                    specialized: 'iPhone, Smartphone, Laptop',
                    experience: '2 Years',
                    rating: '0',
                    jobsCompleted: '1 Completed',
                  ),
                  buildTechnicianCard(
                    context: context,
                    id: '10119757-0fad-11f1-893f-4567899876cvb',
                    name: 'Jaison',
                    location: 'Palakkad',
                    contactEmail: 'jaison@gmail.com',
                    contactPhone: '7984987632',
                    specialized: 'iPhone, Smartphone, Laptop',
                    experience: '7 Years',
                    rating: '4.5',
                    jobsCompleted: '1124 Completed',
                  ),
                ],
              ),
            ),
          ),
          DraggableFabMenu(adminDashboardKey: _technicianKey),
        ],
      ),
    );
  }

  Widget buildTechnicianCard({
    required BuildContext context,
    required String id,
    required String name,
    required String location,
    required String contactEmail,
    required String contactPhone,
    required String specialized,
    required String experience,
    required String rating,
    required String jobsCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF718355),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.engineering,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name\n$location',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$contactEmail\n$contactPhone',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove_red_eye, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF718355),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Technician Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildDetailRow("Technician ID", id, Colors.white70),
                        const Divider(color: Colors.white24, height: 16),
                        _buildDetailRow("Name", name, Colors.white),
                        _buildDetailRow("Location", location, Colors.white70),
                        _buildDetailRow("Email", contactEmail, Colors.white70),
                        _buildDetailRow("Phone", contactPhone, Colors.white70),
                        _buildDetailRow("Specialized in", specialized, Colors.white70),
                        _buildDetailRow("Experience", experience, Colors.white70),
                        _buildDetailRow("Rating", rating, const Color(0xFF61DAFB)),
                        _buildDetailRow("Jobs Completed", jobsCompleted, Colors.white),
                      ],
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: null, // Disable until implemented
                              child: const Text(
                                "Block",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Remove",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildDetailRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$label:",
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}