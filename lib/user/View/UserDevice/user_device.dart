// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';
// // import 'package:mobile_servies/user/View/UserDevice/devicewidget.dart';
// // import 'package:mobile_servies/user/constants/textconstants.dart';
// // import 'package:mobile_servies/user/decoration/decoration.dart';
// // import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

// // class UserDevice extends StatelessWidget {
// //  const  UserDevice({super.key});
  

// //   @override
// //   Widget build(BuildContext context) {
// //     TextEditingController searchController=TextEditingController();
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Row(children: [
// //           text(TextConstants.title1, Color(0xFF61DAFB), 30, FontWeight.bold),
// //             text(TextConstants.title2, Colors.white, 30, FontWeight.bold),
// //         ],),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Column(
          
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Gap(30),
            
// //             text(TextConstants.ourDevices, Colors.white, 30, FontWeight.bold),
// //             Gap(10),
// //             text(TextConstants.urservice1, Colors.white, 20, FontWeight.normal),
// //             Gap(10),
// //             TextField(
// //               controller: searchController,
// //               decoration: InputDecoration(
// //                 hintText: 'Search Devices',
// //                 border: OutlineInputBorder(),
// //                 prefixIcon: icon(Icons.search, Colors.white)
// //               ),
              
// //             ),
// //             Gap(20),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: 2,
// //                 itemBuilder: (context,index){
// //                 return Card(
// //                   color:const Color(0x3361DAFB) ,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Column( 
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         ListTile(
// //                           leading: icon(Icons.phone_iphone, Colors.white),
// //                           // title:text('iphone 13', const Color.fromARGB(255, 215, 215, 215), 25, FontWeight.bold),
// //                           title: Row(
                            
// //                             children: [
// //                             text('iphone 13', const Color.fromARGB(255, 215, 215, 215), 25, FontWeight.bold),
// //                             Gap(25),
// //                             containerStyle(30, 130, Color(0xFF181850),
// //                            Center(child: text('SmartPhone', Colors.white, 15, FontWeight.normal)))
// //                           ],),
// //                           subtitle:text('Apple', const Color.fromARGB(255, 215, 215, 215), 20, FontWeight.bold),
                          
// //                         ),
                        
// //                           ListTile(
// //                             leading: icon(Icons.info, Colors.white),
// //                             title: text('Model: A2634', Colors.white, 15, FontWeight.normal),
// //                           ),
// //                            ListTile(
// //                             leading: icon(Icons.calendar_month, Colors.white),
// //                             title: text('Released: 2021', Colors.white, 15, FontWeight.normal),
// //                           ),
                        
                        
// //                         Gap(20),
// //                         Center(
// //                           child: ElevatedButton(
// //                            style: ElevatedButton.styleFrom(
// //       backgroundColor:Color(0xFF181850),
// //       padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 8),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(15),
      
// //       ),
// //     ),
// //                             onPressed: (){
// //                                  showDeviceDetailDialog(context)   ;          
// //                           }, child: text(TextConstants.viewDetails, Colors.white, 18, FontWeight.bold)),
// //                         )
                        
// //                       ],
// //                     ),
// //                   ),
// //                 );
              
// //               }),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }


// //   void showDeviceDetailDialog(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (_) => Dialog(
// //       insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
// //       child: SizedBox(
// //         width: double.infinity, // Takes full screen width
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               text('Device details', Colors.black, 22, FontWeight.bold),
// //               Gap(10),
// //               detailRow('Brand', 'Samsung'),
// //               detailRow('Model', 'S23'),
// //               detailRow('Type', 'Smartphone'),
// //               detailRow('Release Year', '2024'),
// //               Gap(10),
// //               text('⚠️ Common Issues', Colors.black, 16, FontWeight.bold),
// //               Wrap(
// //                 spacing: 6,
// //                 children: [
// //                   Chip(label: Text('display'), backgroundColor: Colors.orange[200]),
// //                 ],
// //               ),
// //               Gap(10),
// //               text('🛠️ Repairable Components', Colors.black, 16, FontWeight.bold),
// //               Wrap(
// //                 spacing: 6,
// //                 children: [
// //                   Chip(label: Text('display'), backgroundColor: Colors.blue[100]),
// //                   Chip(label: Text('battery'), backgroundColor: Colors.blue[100]),
// //                   Chip(label: Text('camera'), backgroundColor: Colors.blue[100]),
// //                 ],
// //               ),
// //               Gap(10),
// //               Align(
// //                 alignment: Alignment.centerRight,
// //                 child: TextButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   child: text('Close', Colors.blue, 16, FontWeight.bold),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// // }



// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/constants/textconstants.dart';
// import 'package:mobile_servies/user/decoration/decoration.dart';
// import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

// class UserDevice extends StatelessWidget {
//   const UserDevice({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();
//     return Scaffold(
//       backgroundColor: const Color(0xFF718355),
//       body: Column(
//         children: [
//           const Gap(120), // Space at the top with green background
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFF5F5F5),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(40),
//                   topLeft: Radius.circular(40),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: Text(
//                               TextConstants.ourDevices,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 38,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFF2E2E2E),
//                                 letterSpacing: 0.5,
//                                 shadows: [
//                                   Shadow(
//                                     color: Colors.grey.withOpacity(0.2),
//                                     offset: const Offset(2, 2),
//                                     blurRadius: 4,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
                         
//                         ],
//                       ),
//                       const Gap(8),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Text(
//                           TextConstants.urservice1,
//                           style: GoogleFonts.openSans(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF5A5A5A),
//                             letterSpacing: 0.2,
//                           ),
//                         ),
//                       ),
//                       const Gap(20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: TextField(
//                           controller: searchController,
//                           decoration: InputDecoration(
//                             hintText: 'Search Devices',
//                             hintStyle: GoogleFonts.openSans(
//                               color: const Color(0xFF8D8D8D),
//                             ),
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide.none,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
//                             ),
//                             prefixIcon: icon(Icons.search, const Color(0xFF5A5A5A)),
//                           ),
//                           style: GoogleFonts.openSans(
//                             color: const Color(0xFF2E2E2E),
//                           ),
//                         ),
//                       ),
//                       const Gap(20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Text(
//                           "Available Devices",
//                           style: GoogleFonts.poppins(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFF2E2E2E),
//                           ),
//                         ),
//                       ),
//                       const Gap(5),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Text(
//                           "Select a device to view details",
//                           style: GoogleFonts.openSans(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF5A5A5A),
//                           ),
//                         ),
//                       ),
//                       const Gap(20),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: 2,
//                         itemBuilder: (context, index) {
//                           return Card(
//                             color: Color.fromARGB(255, 85, 105, 53),
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           icon(Icons.phone_iphone, const Color(0xFF718355)),
//                                           const Gap(10),
//                                           Text(
//                                             'iPhone 13',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w600,
//                                               color: const Color.fromARGB(255, 255, 255, 255),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Container(
//                                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                         decoration: BoxDecoration(
//                                           color: const Color.fromARGB(255, 255, 255, 255),
//                                           borderRadius: BorderRadius.circular(15),
//                                         ),
//                                         child: Text(
//                                           'SmartPhone',
//                                           style: GoogleFonts.poppins(
//                                             fontSize: 12,
//                                             fontWeight: FontWeight.w600,
//                                             color: const Color(0xFF718355),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Gap(5),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 40.0),
//                                     child: Text(
//                                       'Apple',
//                                       style: GoogleFonts.openSans(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: const Color.fromARGB(255, 255, 255, 255),
//                                       ),
//                                     ),
//                                   ),
//                                   const Gap(15),
//                                   Row(
//                                     children: [
//                                       icon(Icons.info, const Color.fromARGB(255, 255, 255, 255)),
//                                       const Gap(10),
//                                       Text(
//                                         'Model: A2634',
//                                         style: GoogleFonts.openSans(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                           color: const Color.fromARGB(255, 255, 255, 255),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Gap(10),
//                                   Row(
//                                     children: [
//                                       icon(Icons.calendar_month, const Color.fromARGB(255, 255, 255, 255)),
//                                       const Gap(10),
//                                       Text(
//                                         'Released: 2021',
//                                         style: GoogleFonts.openSans(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                           color: const Color.fromARGB(255, 255, 255, 255),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Gap(20),
//                                   Center(
//                                     child: customButton(
//                                       label: TextConstants.viewDetails,
//                                       icon: null,
//                                       onPressed: () {
//                                         showDeviceDetailDialog(context);
//                                       },
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       const Gap(20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void showDeviceDetailDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => Dialog(
//         insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
//         backgroundColor: Colors.white,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Device Details',
//                   style: GoogleFonts.poppins(
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xFF2E2E2E),
//                   ),
//                 ),
//                 const Gap(10),
//                 detailRow('Brand', 'Samsung'),
//                 detailRow('Model', 'S23'),
//                 detailRow('Type', 'Smartphone'),
//                 detailRow('Release Year', '2024'),
//                 const Gap(10),
//                 Text(
//                   '⚠️ Common Issues',
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xFF2E2E2E),
//                   ),
//                 ),
//                 Wrap(
//                   spacing: 6,
//                   children: [
//                     Chip(
//                       label: Text(
//                         'display',
//                         style: GoogleFonts.openSans(
//                           fontSize: 14,
//                           color: const Color(0xFF2E2E2E),
//                         ),
//                       ),
//                       backgroundColor: Colors.orange[100],
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                   ],
//                 ),
//                 const Gap(10),
//                 Text(
//                   '🛠️ Repairable Components',
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xFF2E2E2E),
//                   ),
//                 ),
//                 Wrap(
//                   spacing: 6,
//                   children: [
//                     Chip(
//                       label: Text(
//                         'display',
//                         style: GoogleFonts.openSans(
//                           fontSize: 14,
//                           color: const Color(0xFF2E2E2E),
//                         ),
//                       ),
//                       backgroundColor: Colors.blue[100],
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                     Chip(
//                       label: Text(
//                         'battery',
//                         style: GoogleFonts.openSans(
//                           fontSize: 14,
//                           color: const Color(0xFF2E2E2E),
//                         ),
//                       ),
//                       backgroundColor: Colors.blue[100],
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                     Chip(
//                       label: Text(
//                         'camera',
//                         style: GoogleFonts.openSans(
//                           fontSize: 14,
//                           color: const Color(0xFF2E2E2E),
//                         ),
//                       ),
//                       backgroundColor: Colors.blue[100],
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                     ),
//                   ],
//                 ),
//                 const Gap(10),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () => Navigator.pop(context),
//                     child: Text(
//                       'Close',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: const Color(0xFF718355),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget detailRow(String label, String value) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 2),
//     child: Row(
//       children: [
//         Text(
//           "$label: ",
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFF2E2E2E),
//           ),
//         ),
//         Expanded(
//           child: Text(
//             value,
//             style: GoogleFonts.openSans(
//               fontSize: 16,
//               color: const Color(0xFF5A5A5A),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }