import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Servicess/addservice.dart';
import 'package:mobile_servies/admin/view/Servicess/editService.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/admin/widgets.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';

class Servicepage extends StatelessWidget {
  Servicepage({super.key});
  final GlobalKey _serviceKey = GlobalKey();

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
                    "Services",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Service Management",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddServicePage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Add Service",
                          style: TextStyle(color: Color(0xFF718355)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _buildServiceCard(
                    context,
                    id: '06384cad-3405-4dcr-88bd-c702845678d84f3',
                    serviceName: 'Storage Increase',
                    description: 'Increase your phone\'s storage',
                    amount: 999,
                    estimatedTime: '90 Minutes',
                    category: 'Repair',
                  ),
                  _buildServiceCard(
                    context,
                    id: '06384cad-3405-4dcr-88bd-c702845678d84f3',
                    serviceName: 'Camera Cleanup',
                    description: 'Camera cleaning',
                    amount: 199,
                    estimatedTime: '10 Minutes',
                    category: 'Cleaning',
                  ),
                ],
              ),
            ),
          ),
          DraggableFabMenu(adminDashboardKey: _serviceKey),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String id,
    required String serviceName,
    required String description,
    required String estimatedTime,
    required double amount,
    required String category,
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
              Icons.phone_android_rounded,
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
                  serviceName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  estimatedTime,
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Popular",
                  style: TextStyle(
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
                  backgroundColor: const Color(0xFF718355),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Service Details",
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
                        _buildDetailRow("Service ID", id, Colors.white70),
                        const Divider(color: Colors.white24, height: 16),
                        _buildDetailRow("Service", serviceName, Colors.white),
                        _buildDetailRow("Description", description, Colors.white70),
                        _buildDetailRow("Estimated Time", estimatedTime, Colors.white70),
                        _buildDetailRow("Category", category, Colors.white70),
                        _buildDetailRow("Amount", "\$${amount.toStringAsFixed(2)}", Colors.white),
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
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Editservice()),
                              ),
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                  color: Color(0xFF718355),
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
                                backgroundColor: AppColors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                "Close",
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