// import 'package:flutter/material.dart';
// import 'package:mobile_servies/admin/view/Device/add_device.dart';
// import 'package:mobile_servies/admin/view/Device/edit_device.dart';
// import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
// import 'package:mobile_servies/admin/widgets.dart';
// import 'package:mobile_servies/tech/constants/colors.dart';
// import 'package:mobile_servies/user/View/UserHome/user_home.dart';

// class Devicepage extends StatelessWidget {
//   Devicepage({super.key});
//   final GlobalKey _deviceKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 50),
//                   AppLogo(),
//                   const SizedBox(height: 30),
//                   const Text(
//                     "Devices",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                       fontSize: 32,
//                     ),
//                   ),
//                   const Text(
//                     "Manage bookings, services, devices, and technicians",
//                     style: TextStyle(color: Colors.grey, fontSize: 16),
//                   ),
//                   const SizedBox(height: 25),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Device Management",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => AddDeviceScreen()),
//                           );
//                         },
//                         child: const Text(
//                           "Add Device",
//                           style: TextStyle(color: Color(0xFF718355)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//                   buildDeviceCard(
//                     context,
//                     id: '10119757-0fad-11f1-893f-4567899876cvb',
//                     brand: 'Apple',
//                     name: 'iPhone 13',
//                     model: 'A2694',
//                     type: 'Smartphone',
//                     year: '2021',
//                     repairableParts: 'Battery, Display, Charging port, Screen',
//                     commonIssues: 'Battery Draining, Screen flickering',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           DraggableFabMenu(adminDashboardKey: _deviceKey),
//         ],
//       ),
//     );
//   }

//   Widget buildDeviceCard(
//     BuildContext context, {
//     required String id,
//     required String brand,
//     required String name,
//     required String model,
//     required String type,
//     required String year,
//     required String repairableParts,
//     required String commonIssues,
//     bool isCompleted = true,
//     bool isScheduled = false,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF718355),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 50,
//             height: 50,
//             decoration: BoxDecoration(
//               color: AppColors.green,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(
//               Icons.phone_android_outlined,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   brand,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 Text(
//                   type,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w400,
//                     color: Colors.white54,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.remove_red_eye, color: Colors.white),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   backgroundColor: const Color(0xFF718355),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Device Details",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22,
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.close, color: Colors.white70),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                     ],
//                   ),
//                   content: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         _buildDetailRow("Device ID", id, Colors.white70),
//                         const Divider(color: Colors.white24, height: 16),
//                         _buildDetailRow("Brand", brand, Colors.white),
//                         _buildDetailRow("Name", name, Colors.white),
//                         _buildDetailRow("Model", model, Colors.white70),
//                         _buildDetailRow("Type", type, Colors.white70),
//                         _buildDetailRow("Year", year, Colors.white70),
//                         _buildDetailRow("Repairable Parts", repairableParts, Colors.white70),
//                         _buildDetailRow("Common Issues", commonIssues, Colors.white70),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 12),
//                               ),
//                               onPressed: () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => EditDevice()),
//                               ),
//                               child: const Text(
//                                 "Edit",
//                                 style: TextStyle(
//                                   color: Color(0xFF718355),
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppColors.green,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(vertical: 12),
//                               ),
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text(
//                                 "Close",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value, Color valueColor) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "$label:",
//             style: const TextStyle(
//               color: Colors.white54,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 color: valueColor,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//               textAlign: TextAlign.end,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Device/add_device.dart';
import 'package:mobile_servies/admin/view/Device/edit_device.dart';
import 'package:mobile_servies/admin/view/DragBtn/draggable_button.dart';
import 'package:mobile_servies/admin/widgets.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';

class Devicepage extends StatelessWidget {
  Devicepage({super.key});
  final GlobalKey _deviceKey = GlobalKey();

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
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 25),
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
                                MaterialPageRoute(builder: (context) => AddDeviceScreen()),
                              );
                            },
                            child: const Text(
                              "Add Device",
                              style: TextStyle(color: Color(0xFF718355)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
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
                          children: [
                            buildDeviceCard(
                              context,
                              id: '10119757-0fad-11f1-893f-4567899876cvb',
                              brand: 'Apple',
                              name: 'iPhone 13',
                              model: 'A2694',
                              type: 'Smartphone',
                              year: '2021',
                              repairableParts: 'Battery, Display, Charging port, Screen',
                              commonIssues: 'Battery Draining, Screen flickering',
                            ),
                          ],
                        ),
                      ),
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
    required String id,
    required String brand,
    required String name,
    required String model,
    required String type,
    required String year,
    required String repairableParts,
    required String commonIssues,
    bool isCompleted = true,
    bool isScheduled = false,
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
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  brand,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                Text(
                  type,
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
                        _buildDetailRow("Device ID", id, Colors.white70),
                        const Divider(color: Colors.white24, height: 16),
                        _buildDetailRow("Brand", brand, Colors.white),
                        _buildDetailRow("Name", name, Colors.white),
                        _buildDetailRow("Model", model, Colors.white70),
                        _buildDetailRow("Type", type, Colors.white70),
                        _buildDetailRow("Year", year, Colors.white70),
                        _buildDetailRow("Repairable Parts", repairableParts, Colors.white70),
                        _buildDetailRow("Common Issues", commonIssues, Colors.white70),
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
                                MaterialPageRoute(builder: (context) => EditDevice()),
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