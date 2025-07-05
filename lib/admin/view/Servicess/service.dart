import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/add_service_model.dart';
import 'package:mobile_servies/admin/controller/add_service_provider.dart';
import 'package:mobile_servies/admin/view/Servicess/addservice.dart';
import 'package:mobile_servies/admin/view/Servicess/editService.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:provider/provider.dart';

class Servicepage extends StatefulWidget {
  const Servicepage({super.key});

  @override
  _ServicepageState createState() => _ServicepageState();
}

class _ServicepageState extends State<Servicepage> {
  final GlobalKey _serviceKey = GlobalKey();
  final TextEditingController searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ServiceProvider>(context, listen: false).fetchServices();
    });
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
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
                        "Services",
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
                      serviceSearchField(
                        context: context,
                        onChanged: (value) {
                          Provider.of<ServiceProvider>(context, listen: false).searchFn(value);
                        },
                        controller: searchCtrl,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Services",
                            key: _serviceKey,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            onPressed: () async {
                              final result = await Navigator.push<bool>(
                                context,
                                MaterialPageRoute(builder: (context) => const AddServicePage()),
                              );
                              if (result == true) {
                                _showSnackBar("Service added successfully");
                              } else if (result == false) {
                                _showSnackBar("Failed to add service", isError: true);
                              }
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.construction_outlined,
                                  color: Color(0xFF718355),
                                  size: 18,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Add Service",
                                  style: TextStyle(
                                    color: Color(0xFF718355),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Consumer<ServiceProvider>(
                      builder: (context, provider, _) {
                        if (provider.isLoading) {
                          return buildShimmerList();
                        }
                        if (provider.error != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.error_outline, color: Colors.red, size: 40),
                                const SizedBox(height: 16),
                                Text(
                                  "Error: ${provider.error}",
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () => provider.fetchServices(),
                                  child: const Text("Retry"),
                                ),
                              ],
                            ),
                          );
                        }
                        if (provider.searchedList.isEmpty) {
                          return const Center(
                            child: Text(
                              'No services found',
                              style: TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RefreshIndicator(
                             onRefresh: () => provider.fetchServices(),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.searchedList.length,
                              itemBuilder: (context, index) {
                                final service = provider.searchedList[index];
                                return _buildServiceCard(
                                  context,
                                  service: service,
                                  onDelete: () async {
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Confirm Delete"),
                                        content: Text("Are you sure you want to delete ${service.serviceName}?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, false),
                                            child: const Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, true),
                                            child: const Text(
                                              "Delete",
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                    if (confirmed == true) {
                                      final success = await provider.deleteService(service.serviceId);
                                      _showSnackBar(
                                        success ? "Service deleted successfully" : "Failed to delete service",
                                        isError: !success,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableFabMenu(adminDashboardKey: _serviceKey),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required Service service,
    required VoidCallback onDelete,
  }) {
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
              color: AppColors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.phone_android_rounded,
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
                  service.serviceName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  service.category,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${service.estimatedTime} Minutes',
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
                "\$${service.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              if (service.isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10),
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
                        "Service Details",
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
                        _buildDetailRow("Service ID", service.serviceId, Colors.white70),
                        _buildDetailRow("Service", service.serviceName, Colors.white),
                        _buildDetailRow("Description", service.description, Colors.white70),
                        _buildDetailRow("Estimated Time", "${service.estimatedTime} Minutes", Colors.white70),
                        _buildDetailRow("Category", service.category, Colors.white70),
                        _buildDetailRow("Amount", "\$${service.price.toStringAsFixed(2)}", Colors.white),
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
                              onPressed: () async {
                                Navigator.pop(context);
                                final result = await Navigator.push<bool>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditService(service: service),
                                  ),
                                );
                                if (result == true) {
                                  _showSnackBar("Service updated successfully");
                                } else if (result == false) {
                                  _showSnackBar("Failed to update service", isError: true);
                                }
                              },
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                  color: Color(0xFF718355),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
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
                                  fontSize: 14,
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
          PopupMenuButton<String>(
            offset: Offset(0, -40),
            icon: const Icon(Icons.more_vert, color: Colors.white, size: 24),
            onSelected: (value) {
              if (value == 'delete') {
                onDelete();
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                height: 30,
                value: 'delete',
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Text('Delete', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
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