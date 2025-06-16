import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_servies/admin/controller/completedOrder_Provider.dart';
import 'package:mobile_servies/admin/service/completed_order_admin_service.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class Cmpltedorderpage extends StatelessWidget {
  Cmpltedorderpage({super.key});

  final GlobalKey _cmpltOrders = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompletedorderProvider(
        CompletedOrderService(
          dio: Dio(),
          baseURL: 'https://mobilemend-backend.onrender.com',
        ),
      )..fetchCompletedOrders(),
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLogo(),
                        const SizedBox(height: 30),
                        const Text(
                          "Completed Orders",
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
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF718355)),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Consumer<CompletedorderProvider>(
                          builder: (context, value, child) {
                            if (value.isLoading) {
                              return buildShimmerList();
                            }
                            if (value.error != null) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.error!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    if (value.error!.contains('Authentication failed'))
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserLogin(),));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Text(
                                            'Log In',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    if (!value.error!.contains('Authentication failed'))
                                      Padding(
                                        padding: const EdgeInsets.only(top: 16.0),
                                        child: ElevatedButton(
                                          onPressed: () => value.fetchCompletedOrders(),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.green,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: const Text(
                                            'Retry',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            }
                            if (value.completedOrders.isEmpty) {
                              return const Center(child: Text('No completed orders found'));
                            }
                            return ListView.builder(
                              itemCount: value.completedOrders.length,
                              itemBuilder: (context, index) {
                                final order = value.completedOrders[index];
                                return _buildCompletedCard(
                                  context,
                                  serviceID: order.id,
                                  customerName: order.customerName ?? 'Unknown',
                                  device: order.device ?? 'Unknown',
                                  issue: order.issue ?? 'Unknown',
                                  date: order.date != null
                                      ? DateFormat('dd/MM/yyyy').format(order.date!)
                                      : 'Unknown',
                                  location: order.location ?? 'Unknown',
                                  amount: order.amount ?? 0.0,
                                  service: order.service ?? 'Unknown',
                                  status: order.status,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DraggableFabMenu(adminDashboardKey: _cmpltOrders),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedCard(
    BuildContext context, {
    required String serviceID,
    required String customerName,
    required String device,
    required String issue,
    required String date,
    required String location,
    required double amount,
    required String service,
    required String status,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF718355),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 93, 183, 96).withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.task_alt_rounded,
              color: const Color.fromARGB(255, 182, 227, 185),
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
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                Text(
                  device,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white54,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
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
                                "Booking Details",
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
                                _buildDetailRow("Service ID", serviceID, Colors.white70),
                                const Divider(color: Colors.white24, height: 16),
                                _buildDetailRow("Customer", customerName, Colors.white),
                                _buildDetailRow("Device", device, Colors.white70),
                                _buildDetailRow("Issue", issue, Colors.white70),
                                _buildDetailRow("Service", service, Colors.white70),
                                _buildDetailRow("Date", date, Colors.white70),
                                _buildDetailRow("Location", location, Colors.white70),
                                _buildDetailRow("Amount", "\$${amount.toStringAsFixed(2)}", Colors.white),
                                _buildDetailRow("Status", status, AppColors.green),
                              ],
                            ),
                          ),
                          actions: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
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