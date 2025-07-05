import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/technicianList_model.dart';
import 'package:mobile_servies/admin/controller/technicianList_provider.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:provider/provider.dart';

class Techicianpage extends StatefulWidget {
  const Techicianpage({super.key});

  @override
  _TechicianpageState createState() => _TechicianpageState();
}

class _TechicianpageState extends State<Techicianpage> {
  final GlobalKey _technicianKey = GlobalKey();
  final TextEditingController searchCtrl = TextEditingController();
  bool _hasFetched = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<TechnicianListProvider>();
      if (!provider.isLoading && provider.technicians.isEmpty && !_hasFetched) {
        provider.fetchTechnicians();
        _hasFetched = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        "Technicians",
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
                      const SizedBox(height: 16),
                      techListSearchField(
                        context: context,
                        onChanged: (value) {
                          Provider.of<TechnicianListProvider>(context, listen: false).searchFn(value);
                        },
                        controller: searchCtrl,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "All Technicians",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Consumer<TechnicianListProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading) {
                            return buildShimmerList();
                          }
                          if (provider.error != null) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    provider.error!,
                                    style: const TextStyle(color: Colors.red, fontSize: 18),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () => provider.refreshTechnicians(),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF718355),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            );
                          }
                          if (provider.searchedList.isEmpty) {
                            return const Center(
                              child: Text(
                                'No technicians found',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          }
                          return RefreshIndicator(
                            onRefresh: () => provider.refreshTechnicians(),
                            child: ListView.builder(
                              itemCount: provider.searchedList.length,
                              itemBuilder: (context, index) {
                                final technician = provider.searchedList[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: buildTechnicianCard(
                                    context: context,
                                    technician: technician,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableFabMenu(adminDashboardKey: _technicianKey),
        ],
      ),
    );
  }

  Widget buildTechnicianCard({
    required BuildContext context,
    required TechnicianListModel technician,
  }) {
    return Container(
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
              color: AppColors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.engineering,
              color: AppColors.green,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  technician.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Text(
                  technician.contactPhone,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                Text(
                  technician.location,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                technician.experienceText,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: technician.statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: technician.statusColor,
                    width: 1,
                  ),
                ),
                child: Text(
                  technician.statusText,
                  style: TextStyle(
                    color: technician.statusColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.remove_red_eye, color: Colors.white, size: 24),
            onPressed: () => _showTechnicianDetails(context, technician),
          ),
        ],
      ),
    );
  }

  void _showTechnicianDetails(BuildContext context, TechnicianListModel technician) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF718355),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Technician Details",
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
                _buildDetailRow("Technician ID", technician.id, Colors.white70),
                _buildDetailRow("Name", technician.name, Colors.white),
                _buildDetailRow("Location", technician.location, Colors.white70),
                _buildDetailRow("Email", technician.contactEmail, Colors.white70),
                _buildDetailRow("Phone", technician.contactPhone, Colors.white70),
                _buildDetailRow("Specialized in", technician.specialized, Colors.white70),
                _buildDetailRow("Experience", technician.experienceText, Colors.white70),
                _buildDetailRow("Jobs Completed", technician.jobsCompletedText, Colors.white),
                _buildDetailRow("Rating", technician.rating, Colors.white70),
                _buildDetailRow("Pending Jobs", technician.pendingJobs.toString(), Colors.white70),
                _buildDetailRow(
                  "Status",
                  technician.statusText,
                  technician.statusColor,
                ),
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
                    child: Consumer<TechnicianListProvider>(
                      builder: (context, provider, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: technician.isBlocked ? Colors.orange : AppColors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: provider.isLoading
                              ? null
                              : () => _handleBlockAction(context, technician, provider),
                          child: provider.isLoading && provider.technicians.any((t) => t.id == technician.id)
                              ? const CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  technician.isBlocked ? "Unblock" : "Block",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                        );
                      },
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
                        "Close",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleBlockAction(
      BuildContext context, TechnicianListModel technician, TechnicianListProvider provider) async {
    final shouldBlock = !technician.isBlocked;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(shouldBlock ? 'Confirm Block' : 'Confirm Unblock'),
        content: Text(shouldBlock
            ? 'Are you sure you want to block this technician?'
            : 'Are you sure you want to unblock this technician?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(shouldBlock ? 'Block' : 'Unblock'),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      await provider.blockTechnician(technician.id, shouldBlock, context);
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
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
                fontSize: 17,
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