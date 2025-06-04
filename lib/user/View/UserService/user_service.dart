// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/constants/textconstants.dart';
// import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

// class UserService extends StatelessWidget {
//   const UserService({super.key});

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
//                               TextConstants.urservice,
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
//                             hintText: 'Search Services',
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
//                           "Available Services",
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
//                           "Choose a service to book",
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
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return Card(
//                             color: Color(0xFF718355),
//                             elevation: 2,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(20.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Increase Storage',
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w600,
//                                           color: const Color.fromARGB(255, 255, 255, 255),
//                                         ),
//                                       ),
//                                       Row(
//                                         children: [
//                                           icon(Icons.thumb_up_outlined, const Color(0xFFF5F5F5)),
//                                           const Gap(5),
//                                           Text(
//                                             'Popular',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w600,
//                                               color: const Color(0xFFF5F5F5),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   const Gap(5),
//                                   Text(
//                                     'INR 2499.00',
//                                     style: GoogleFonts.openSans(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   const Gap(7),
//                                   Text(
//                                     'Increase your phone storage',
//                                     style: GoogleFonts.openSans(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                       color: const Color.fromARGB(255, 255, 255, 255),
//                                     ),
//                                   ),
//                                   const Gap(10),
//                                   Row(
//                                     children: [
//                                       icon(Icons.watch_later_rounded, const Color(0xFF718355)),
//                                       const Gap(5),
//                                       Text(
//                                         '90 min',
//                                         style: GoogleFonts.openSans(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                           color: const Color.fromARGB(255, 255, 255, 255),
//                                         ),
//                                       ),
//                                       const Gap(20),
//                                       icon(Icons.local_offer_outlined, const Color(0xFF718355)),
//                                       const Gap(5),
//                                       Text(
//                                         'Repair',
//                                         style: GoogleFonts.openSans(
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.w500,
//                                           color: const Color.fromARGB(255, 255, 255, 255),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Gap(20),
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: customButton(
//                                       label: 'Book Now',
//                                       icon: Icons.arrow_forward,
//                                       onPressed: () {
//                                         // Add booking functionality here
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
// }