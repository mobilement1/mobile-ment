// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:mobile_servies/view/Booking/bookingpage.dart';
// import 'package:mobile_servies/view/Dashbord/widject.dart';

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               "Mobile",
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const Gap(8),
//             Text(
//               "Mend",
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.white,
//         elevation: 1,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Admin Dashboard",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Gap(10),
//               Text(
//                 "Manage bookings, services, devices, and technicians.",
//                 style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//               ),
//               const Gap(20),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton(
//                           style: whiteButtonStyle,
//                           onPressed: () {},
//                           child: Text("Dashboard"),
//                         ),
//                         ElevatedButton(
//                           style: whiteButtonStyle,
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Bookingpage(),
//                                 ));
//                           },
//                           child: Text("Bookings"),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton(
//                           style: whiteButtonStyle,
//                           onPressed: () {},
//                           child: Text("Services"),
//                         ),
//                         ElevatedButton(
//                           style: whiteButtonStyle,
//                           onPressed: () {},
//                           child: Text("Devices"),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton(
//                           style: whiteButtonStyle,
//                           onPressed: () {},
//                           child: Text("Technicians"),
//                         ),
//                         ElevatedButton(
//                           style: whiteButtonStyle,
//                           onPressed: () {},
//                           child: Text("Technician Requests"),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           ElevatedButton(
//                             style: whiteButtonStyle,
//                             onPressed: () {},
//                             child: Text("Completed Orders"),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Gap(20),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Revenue Overview",
//                       style:
//                           TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     Text("Monthly revenue and expenses for this year"),

//                     // graf add space.................................................................//////
//                   ],
//                 ),
//               ),
//               Gap(20),
//               buildRevenueCard(title: 'Total Revenue', amount: '137999.77'),
//               Gap(10),
//               buildRevenueCard(title: 'Total Profit', amount: '65131.07'),
//               Gap(10),
//               buildRevenueCard(title: 'Online Technicians', amount: '4'),
//               Gap(10),
//               buildRevenueCard(title: 'Completed Bookins', amount: '26'),
//               Gap(10),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Popular Services",
//                       style:
//                           TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//                     Text("Most Requested repair services"),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Dashbordpage extends StatefulWidget {
  const Dashbordpage({super.key});

  @override
  State<Dashbordpage> createState() => _DashbordpageState();
}

class _DashbordpageState extends State<Dashbordpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181850),
        iconTheme: IconThemeData(color: Colors.white),
        title: Row(
          children: [
            Text(
              "Mobile",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(8),
            Text(
              "Mend",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Admin Dashboard",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Manage bookings, services, devices, and technicians.",
              style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 139, 138, 138)),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                )
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF1E1E2E),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Admin Dashboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Navigation Items
              ListTile(
                leading: Icon(Icons.dashboard, color: Colors.white),
                title: Text("Dashboard", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.build, color: Colors.white),
                title: Text("Services", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.devices, color: Colors.white),
                title: Text("Devices", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.engineering, color: Colors.white),
                title:
                    Text("Technicians", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),

              ListTile(
                leading: Icon(Icons.book_online, color: Colors.white),
                title: Text("Booking", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.white),
                title: Text("Completed Orders",
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.engineering, color: Colors.white),
                title: Text("Technician Requests",
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
