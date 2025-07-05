import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/Model/add_device_model.dart';
import 'package:mobile_servies/admin/controller/add_device_provider.dart';
import 'package:mobile_servies/admin/view/Device/add_device.dart';
import 'package:mobile_servies/admin/view/Device/edit_device.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:provider/provider.dart';

class Devicepage extends StatefulWidget {
  const Devicepage({super.key});

  @override
  _DevicepageState createState() => _DevicepageState();
}

class _DevicepageState extends State<Devicepage> {
  final GlobalKey _deviceKey = GlobalKey();
  final TextEditingController searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DeviceProvider>(context, listen: false).fetchDevices();
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLogo(),
                      const SizedBox(height: 15),
                      const Text(
                        "Devices",
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
                      deviceSearchField(
                        context: context,
                        onChanged: (value) {
                          Provider.of<DeviceProvider>(context, listen: false).searchFn(value);
                        },
                        controller: searchCtrl,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Device Management",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            onPressed: () async {
                              final result = await Navigator.push<bool>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddDeviceScreen(),
                                ),
                              );
                              if (result == true) {
                                _showSnackBar("Device added successfully");
                              } else if (result == false) {
                                _showSnackBar("Failed to add device", isError: true);
                              }
                            },
                            icon: const Icon(Icons.phone_android_outlined, color: Color(0xFF718355)),
                            label: const Text(
                              "Add Device",
                              style: TextStyle(color: Color(0xFF718355)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
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
                    child: Consumer<DeviceProvider>(
                      builder: (context, provider, child) {
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
                                  onPressed: () => provider.fetchDevices(),
                                  child: const Text("Retry"),
                                ),
                              ],
                            ),
                          );
                        }
                        if (provider.searchedList.isEmpty) {
                          return const Center(
                            child: Text(
                              'No devices found',
                              style: TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: RefreshIndicator(
                            onRefresh: () => provider.fetchDevices(),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: provider.searchedList.length,
                              itemBuilder: (context, index) {
                                final device = provider.searchedList[index];
                                return buildDeviceCard(
                                  context,
                                  device: device,
                                  onDelete: () async {
                                    final confirmed = await showDialog<bool>(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Confirm Delete"),
                                        content: Text("Are you sure you want to delete ${device.deviceName}?"),
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
                                      final success = await provider.deleteDevice(device.deviceId);
                                      _showSnackBar(
                                        success ? "Device deleted successfully" : "Failed to delete device",
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
          DraggableFabMenu(adminDashboardKey: _deviceKey),
        ],
      ),
    );
  }

  Widget buildDeviceCard(
    BuildContext context, {
    required Device device,
    required VoidCallback onDelete,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
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
                Icons.phone_android_outlined,
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
                    device.deviceName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    device.brand,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    device.deviceType,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.remove_red_eye, color: Colors.white),
              onPressed: () {
                showDeviceDetailsDialog(context, device);
              },
            ),
            PopupMenuButton<String>(
              offset: const Offset(0, -50),
              icon: const Icon(Icons.more_vert, color: Colors.white),
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
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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

  void showDeviceDetailsDialog(BuildContext context, Device device) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF718355),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Device Details",
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
                _buildDetailRow("Device ID", device.deviceId, Colors.white70),
                const Divider(color: Colors.white24, height: 16),
                _buildDetailRow("Brand", device.brand, Colors.white),
                _buildDetailRow("Name", device.deviceName, Colors.white),
                _buildDetailRow("Model", device.model, Colors.white70),
                _buildDetailRow("Type", device.deviceType, Colors.white70),
                _buildDetailRow("Year", device.releaseYear.toString(), Colors.white70),
                _buildDetailRow("Repairable Parts", device.repairableComponents, Colors.white70),
                _buildDetailRow("Common Issues", device.commonIssues, Colors.white70),
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
                            builder: (context) => EditDevice(device: device),
                          ),
                        );
                        if (result == true) {
                          _showSnackBar("Device updated successfully");
                        } else if (result == false) {
                          _showSnackBar("Failed to update device", isError: true);
                        }
                      },
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
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
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
        );
      },
    );
  }
}