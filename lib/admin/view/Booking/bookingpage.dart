import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/admin/widgets.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({Key? key}) : super(key: key);

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  String selectedFilter = 'All';
  final List<String> filterOptions = ['All', 'Pending', 'Completed', 'Cancelled'];
  final GlobalKey _bookingPgKey = GlobalKey();

  // Sample data (replace with dynamic source)
  final List<Map<String, dynamic>> bookings = [
    {
      'customerName': 'Emma Johnson',
      'service': 'Screen Replacement',
      'device': 'S23 Ultra',
      'date': 'May 10, 2025',
      'amount': 149.99,
      'status': 'Completed',
      'isCompleted': true,
      'isScheduled': false,
    },
    {
      'customerName': 'Michael Brown',
      'service': 'Battery Replacement',
      'device': 'iPhone 13',
      'date': 'May 11, 2025',
      'amount': 79.99,
      'status': 'In Progress',
      'isCompleted': false,
      'isScheduled': false,
    },
    {
      'customerName': 'Sarah Davis',
      'service': 'Data Recovery',
      'device': 'Nokia',
      'date': 'May 12, 2025',
      'amount': 199.99,
      'status': 'Scheduled',
      'isCompleted': false,
      'isScheduled': true,
    },
    {
      'customerName': 'Jabeel',
      'service': 'Screen Replacement',
      'device': 'Vivo',
      'date': 'May 18, 2025',
      'amount': 799.0,
      'status': 'Completed',
      'isCompleted': true,
      'isScheduled': false,
    },
  ];

  void onFilterChanged(String? newValue) {
    if (newValue == null) return;
    setState(() {
      selectedFilter = newValue;
    });
  }

  List<Map<String, dynamic>> getFilteredBookings() {
    if (selectedFilter == 'All') return bookings;
    return bookings.where((booking) => booking['status'] == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredBookings = getFilteredBookings();

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLogo(),
                      const SizedBox(height: 24),
                      const Text(
                        "Bookings",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      const Text(
                        "Manage bookings, services, devices, and technicians",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Bookings",
                            key: _bookingPgKey,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          DropdownButton<String>(
                            value: selectedFilter,
                            dropdownColor: const Color(0xFF718355),
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                            items: filterOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: const TextStyle(color: Colors.white)),
                              );
                            }).toList(),
                            onChanged: onFilterChanged,
                            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                            underline: Container(height: 1, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: filteredBookings.map((booking) => _buildBookingCard(
                            customerName: booking['customerName'],
                            service: booking['service'],
                            device: booking['device'],
                            date: booking['date'],
                            amount: booking['amount'],
                            status: booking['status'],
                            isCompleted: booking['isCompleted'],
                            isScheduled: booking['isScheduled'],
                          )).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableFabMenu(adminDashboardKey: _bookingPgKey),
        ],
      ),
    );
  }

  Widget _buildBookingCard({
    required String customerName,
    required String service,
    required String device,
    required String date,
    required double amount,
    required String status,
    bool isCompleted = true,
    bool isScheduled = false,
  }) {
    Color statusColor = isCompleted
        ? const Color(0xFF4CAF50)
        : isScheduled
            ? const Color(0xFFFFA726)
            : const Color(0xFF61DAFB);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF718355),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.book,
              color: statusColor,
              size: 24,
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
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  service,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
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
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(10),
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
            icon: const Icon(Icons.remove_red_eye, color: Colors.white, size: 24),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xFF718355),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Booking Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
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
                        _buildDetailRow("Customer", customerName, Colors.white),
                        _buildDetailRow("Service", service, Colors.white70),
                        _buildDetailRow("Device", device, Colors.white70),
                        _buildDetailRow("Date", date, Colors.white70),
                        _buildDetailRow("Amount", "\$${amount.toStringAsFixed(2)}", Colors.white),
                        _buildDetailRow("Status", status, statusColor),
                      ],
                    ),
                  ),
                  actions: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: statusColor,
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
                            fontSize: 14,
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
    );
  }

  Widget _buildDetailRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$label:",
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 14,
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