import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/widgets.dart';

class Techniciarequstpage extends StatefulWidget {
  const Techniciarequstpage({super.key});

  @override
  State<Techniciarequstpage> createState() => _TechniciarequstpageState();
}

class _TechniciarequstpageState extends State<Techniciarequstpage> {
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
              const Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF61DAFB), fontSize: 30)),
              const Text("Mend", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: Colors.white70, size: 26),
                onPressed: () {},
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Text("Technician Request", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 32)),
            const Text("Manage bookings, services, devices, and technicians", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 25),
            _buildTechnicianRequestCard(
              applicantID: "ba7391b9-2d70-11f0-b8d7-862ccfb06e0c",
              contact: "john@gmail.com\n8768839855",
              experience: "3",
              specialisation: "Android, iOS",
              appliedDate: "May 12, 2025",
              status: "Pending",
            ),
            _buildTechnicianRequestCard(
              applicantID: "ba7391b9-2d70-11f0-b8d7-862ccfb06e0c",
              contact: "Jabeel@gmail.com\n7902511693",
              experience: "5",
              specialisation: "Mobile Expert",
              appliedDate: "May 18, 2025",
              status: "Approved",
            ),
            _buildTechnicianRequestCard(
              applicantID: "a7391b9-2d70-11f0-b8d7-862ccfb06e0",
              contact: "rohitsharma@gmail.com",
              experience: "2",
              specialisation: "iOS Specialist",
              appliedDate: "May 25, 2025",
              status: "Rejected",
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      drawer: AdminDraw(),
    );
  }

  Widget _buildTechnicianRequestCard({
    required String applicantID,
    required String contact,
    required String experience,
    required String specialisation,
    required String appliedDate,
    required String status,
  }) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case "approved":
        statusColor = const Color(0xFF4CAF50);
        break;
      case "pending":
        statusColor = const Color(0xFFFFA726);
        break;
      case "rejected":
        statusColor = const Color(0xFFE53935);
        break;
      default:
        statusColor = const Color(0xFF61DAFB);
    }

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color(0xFF1E1E2E),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                  _buildDetailRow("Applicant ID", applicantID, Colors.white70),
                  const Divider(color: Colors.white24, height: 16),
                  _buildDetailRow("Contact", contact, Colors.white),
                  _buildDetailRow("Specialisation", specialisation, Colors.white70),
                  _buildDetailRow("Experience", "$experience years", Colors.white70),
                  _buildDetailRow("Applied Date", appliedDate, Colors.white70),
                  _buildDetailRow("Status", status, statusColor),
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
                          backgroundColor: const Color(0xFF4CAF50), // Green for Approve
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: status.toLowerCase() == "approved" ? null : () {
                          // Add approve logic here
                          setState(() {
                            // Example: Update status (replace with actual backend call)
                            // status = "Approved";
                          });
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Approve",
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
                          backgroundColor: const Color(0xFFE53935), // Red for Reject
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: status.toLowerCase() == "rejected" ? null : () {
                          // Add reject logic here
                          setState(() {
                            // Example: Update status (replace with actual backend call)
                            // status = "Rejected";
                          });
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Reject",
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
                          backgroundColor: const Color(0xFF61DAFB), // Cyan for Close
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF282845),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.engineering, color: statusColor, size: 30),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Exp: $experience yrs",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    appliedDate,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                const SizedBox(height: 8),
            
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
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