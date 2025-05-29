import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/widgets.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  String selectedFilter = 'All';
  final List<String> filterOptions = [
    'All',
    'Pending',
    'Completed',
    'Cancelled'
  ];

  void onFilterChanged(String? newValue) {
    if (newValue == null) return;

    setState(() {
      selectedFilter = newValue;
    });

    print("Selected Booking Filter: $newValue");
  }

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
                "Manage bookings, services, devices, and technicians",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All Bookings",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: selectedFilter,
                    dropdownColor: const Color(0xFF1E1E2E),
                    style: const TextStyle(color: Colors.white),
                    items: filterOptions.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: onFilterChanged,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: Container(height: 1, color: Colors.white24),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildBookingCard(
                customerName: "Emma Johnson",
                service: "Screen Replacement",
                Device: "S23 Ultra",
                date: "May 10, 2025",
                amount: 149.99,
                status: "Completed",
              ),
              _buildBookingCard(
                customerName: "Michael Brown",
                service: "Battery Replacement",
                Device: "iPhone13",
                date: "May 11, 2025",
                amount: 79.99,
                status: "In Progress",
                isCompleted: false,
              ),
              _buildBookingCard(
                customerName: "Sarah Davis",
                service: "Data Recovery",
                Device: "Nokia",
                date: "May 12, 2025",
                amount: 199.99,
                status: "Scheduled",
                isCompleted: false,
                isScheduled: true,
              ),
              _buildBookingCard(
                customerName: 'Jabeel',
                service: 'Screen replacement',
                Device: "Vivo",
                date: 'May 18,2025',
                amount: 799,
                status: 'Pending',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      drawer: AdminDraw(),
    );
  }

  Widget _buildBookingCard({
    required String customerName,
    required String service,
    required String Device,
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
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                        _buildDetailRow("Customer", customerName, Colors.white),
                        _buildDetailRow("Service", service, Colors.white70),
                        _buildDetailRow("Device", Device, Colors.white70),
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