// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';
// // import 'package:mobile_servies/user/View/UserAccount/accountwidget.dart';
// // import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
// // import 'package:mobile_servies/user/constants/textconstants.dart';
// // import 'package:mobile_servies/user/decoration/decoration.dart';

// // class UserProfile extends StatelessWidget {
// //   const UserProfile({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title:  text('My Account', Color(0xFF61DAFB), 30, FontWeight.bold),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
                
// //               CircleAvatar(
// //                 backgroundImage: AssetImage('asset/prf1.png'),
// //                 radius: 60,
// //               ),
// //               text("Zeenath", Colors.white, 25, FontWeight.bold),
// //               text('zeenathtc961@gmail.com', Colors.blue, 18, FontWeight.bold),
// //               Gap(10),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                 containerStyle(130, 130, const Color(0x3361DAFB), Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(children: [
// //                     text('12', Colors.white, 30, FontWeight.bold),
// //                     text('   Total\n Repairs', const Color.fromARGB(255, 174, 173, 173), 20, FontWeight.normal)
                    
// //                   ],),
// //                 )),
// //                 Gap(20),
// //                 containerStyle(130, 130 , const Color(0x3361DAFB), Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(children: [
// //                     text('2', Colors.white, 30, FontWeight.bold),
// //                       text('Active\nOrders', const Color.fromARGB(255, 174, 173, 173), 20, FontWeight.normal)
                      
// //                   ],),
// //                 ))
// //               ],),
// //               Gap(20),
// //                     Align(
// //                       alignment: Alignment.topLeft,
// //                       child: text('Current Repair', Colors.white, 25, FontWeight.bold)),
                   
// //               containerStyle(130, double.infinity, const Color(0x3361DAFB), Row(children: [
// //                 Image.asset('asset/iphone-removebg-preview.png',height: 80,
// //                       width: 80,
// //                       fit: BoxFit.cover,),
// //                       Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                         text('iPhone 13 Screen Repair', Colors.white, 22, FontWeight.bold),
// //                         Gap(10),
// //                         text('Estimated : 2 Hours', Colors.grey, 18, FontWeight.normal),
// //                       ],)
// //               ],)),
// //               Gap(10),
// //               Align(
// //                       alignment: Alignment.topLeft,
// //                       child: text('Account Details', Colors.white, 25, FontWeight.bold)),

// //                       containerStyle(250, double.infinity,  const Color(0x3361DAFB), Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Column(children: [
// //                           accountRow(Icons.phone, '7306706964'),
// //                                             const Divider(color: Color.fromARGB(255, 118, 118, 118),),
// //                                             accountRow(Icons.email, 'zeenathtc961@gmail.com'),
// //                                             const Divider(color: Color.fromARGB(255, 118, 118, 118),),
// //                                             accountRow(Icons.location_on, 'Malappuram, Kerala'),
// //                         ],),
// //                       )),
// //                       Gap(15),
// //                       Align(
// //                       alignment: Alignment.topLeft,
// //                       child: text('Settings', Colors.white, 25, FontWeight.bold)),
// //                         containerStyle(250, double.infinity,  const Color(0x3361DAFB), Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Column(children: [
// //                           accountRow(Icons.notification_important, 'Notifications'),
// //                                             const Divider(color: Color.fromARGB(255, 118, 118, 118),),
// //                                             accountRow(Icons.settings, 'Settings'),
// //                                             const Divider(color: Color.fromARGB(255, 118, 118, 118),),
// //                                             accountRow(Icons.help, 'About Us'),
// //                         ],),
// //                       )),
// //             ],),
// //           ),
// //         )),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';

// class UserProfile extends StatelessWidget {
//   const UserProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF718355),
//       body: Column(
//         children: [
//           const Gap(140), // Space at the top with green background
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
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                             child: Text(
//                               'My Account',
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
//                       const Gap(20),
//                       Center(
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: const AssetImage('asset/prf1.png'),
//                               radius: 60,
//                               backgroundColor: Colors.white,
//                               foregroundColor: const Color(0xFF718355),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: const Color(0xFF718355),
//                                     width: 3,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const Gap(10),
//                             Text(
//                               "Zeenath",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w600,
//                                 color: const Color(0xFF2E2E2E),
//                               ),
//                             ),
//                             Text(
//                               'zeenathtc961@gmail.com',
//                               style: GoogleFonts.openSans(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xFF718355),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const Gap(20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Card(
//                             color: Color(0xFF718355),
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     '12',
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w600,
//                                       color: const Color.fromARGB(255, 255, 255, 255),
//                                     ),
//                                   ),
//                                   Text(
//                                     'Total Repairs',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.openSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: const Color.fromARGB(255, 255, 255, 255),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const Gap(20),
//                           Card(
//                             color: Color(0xFF718355),
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                             child: Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     '2',
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.w600,
//                                       color: const Color.fromARGB(255, 254, 254, 254),
//                                     ),
//                                   ),
//                                   Text(
//                                     'Active Orders',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.openSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                       color: const Color.fromARGB(255, 255, 255, 255),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const Gap(30),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'Current Repair',
//                             style: GoogleFonts.poppins(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w600,
//                               color: const Color(0xFF2E2E2E),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Gap(10),
//                       Card(
//                         color: Color(0xFF718355),
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Row(
//                             children: [
//                              Card(child: Icon(Icons.phone_android,color: Color(0xFF718355),),color: Color.fromARGB(255, 255, 255, 255),),
//                               const Gap(10),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'iPhone 13 Screen Repair',
//                                       style: GoogleFonts.poppins(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600,
//                                         color: const Color.fromARGB(255, 255, 255, 255),
//                                       ),
//                                     ),
//                                     const Gap(5),
//                                     Text(
//                                       'Estimated: 2 Hours',
//                                       style: GoogleFonts.openSans(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w400,
//                                         color: const Color.fromARGB(255, 253, 253, 253),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Gap(20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'Account Details',
//                             style: GoogleFonts.poppins(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w600,
//                               color: const Color(0xFF2E2E2E),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Gap(10),
//                       Card(
//                         color: Colors.white,
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               accountRow(Icons.phone, '7306706964'),
//                               const Divider(color: Color(0xFF8D8D8D)),
//                               accountRow(Icons.email, 'zeenathtc961@gmail.com'),
//                               const Divider(color: Color(0xFF8D8D8D)),
//                               accountRow(Icons.location_on, 'Malappuram, Kerala'),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Gap(20),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'Settings',
//                             style: GoogleFonts.poppins(
//                               fontSize: 22,
//                               fontWeight: FontWeight.w600,
//                               color: const Color(0xFF2E2E2E),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Gap(10),
//                       Card(
//                         color: Colors.white,
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             children: [
//                               accountRow(Icons.notification_important, 'Notifications'),
//                               const Divider(color: Color(0xFF8D8D8D)),
//                               accountRow(Icons.settings, 'Settings'),
//                               const Divider(color: Color(0xFF8D8D8D)),
//                               accountRow(Icons.help, 'About Us'),
//                             ],
//                           ),
//                         ),
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
// }

// Widget accountRow(IconData iconData, String data) {
//   return ListTile(
//     leading: Icon(iconData, color: const Color(0xFF718355)),
//     title: Text(
//       data,
//       style: GoogleFonts.openSans(
//         fontSize: 16,
//         fontWeight: FontWeight.w400,
//         color: const Color(0xFF2E2E2E),
//       ),
//     ),
//     trailing: const Icon(
//       Icons.arrow_forward_ios,
//       color: Color(0xFF5A5A5A),
//       size: 15,
//     ),
//   );
// }