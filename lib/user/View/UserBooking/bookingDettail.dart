// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';
// // import 'package:mobile_servies/user/View/UserBooking/userbookingWidget.dart';
// // import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

// // class BookingDetailPage extends StatefulWidget {
// //   final Map<String, String> booking;

// //   const BookingDetailPage({super.key, required this.booking});

// //   @override
// //   State<BookingDetailPage> createState() => _BookingDetailPageState();
// // }

// // class _BookingDetailPageState extends State<BookingDetailPage> {
// //   bool isCustomerDetailsExpanded = false;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //                 automaticallyImplyLeading: false,
// //         title: text("Booking Details", Colors.white, 25, FontWeight.bold),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: Card(
// //                   color: const Color(0x3361DAFB),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(15.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         IconButton(
// //                             onPressed: () {
// //                               Navigator.of(context).pop();
// //                             },
// //                             icon: icon(Icons.close, Colors.white)),
// //                         rowWidget("Device: ", '${widget.booking['device']}', 50),
// //                         Gap(10),
// //                         rowWidget("Service: ", '${widget.booking['service']}', 50),
// //                         Gap(10),
// //                         rowWidget("Date:", '${widget.booking['date']}', 70),
// //                         Gap(10),
// //                         rowWidget("status:", ' ${widget.booking['status']}', 50,color: Colors.blue),
// //                         Gap(10),
// //                         rowWidget("Technician:", ' ${widget.booking['technician']}', 15),
// //                         Gap(10),
// //                         rowWidget("Payment:", ' ${widget.booking['payment']}', 30),
// //                         Gap(10),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
              
// //               ),
// //               Gap(30),
// //               Align(
// //                 alignment: Alignment.topLeft,
// //                 child: text('Cost Breakdown', Colors.white, 25, FontWeight.bold)),
// //               Gap(15),
// //               bulletText('Service Charge : ₹399', const Color.fromARGB(255, 173, 172, 172), 20, FontWeight.normal),
// //               Gap(10),
// //               bulletText('Travel Allowance :₹157.43', const Color.fromARGB(255, 173, 172, 172), 20, FontWeight.normal),
// //               Gap(10),
// //               bulletText('Booking Charge: ₹199', const Color.fromARGB(255, 173, 172, 172), 20, FontWeight.normal),
// //               Gap(10),
// //               bulletText('Total Cost: ₹755.43', Colors.white, 20, FontWeight.bold),
// // Gap(30),
// //        InkWell(
// //         onTap: () {
// //                   setState(() {
// //                     isCustomerDetailsExpanded = !isCustomerDetailsExpanded;
// //                   });
// //                 },
// //                 child: Row(children: [
// //                   text(
// //                       isCustomerDetailsExpanded ? "Show Customer Details" :"Hide Details" ,
// //                        Colors.blue, 20,FontWeight.bold
// //                     ),
// //                     Icon(
// //                       isCustomerDetailsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
// //                       color: Colors.blue,weight: 25,
// //                     )
// //                 ],),
// //        ),
// //        Gap(10),
// //        if (isCustomerDetailsExpanded)
// //                 Card(
// //                   color: const Color(0x3361DAFB),
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(15.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         text('Customer Details', Colors.white, 22, FontWeight.bold),
// //                         Gap(15),
// //                         rowWidget("Name:","Zeenath" , 30),
// //                         Gap(10),
// //                         rowWidget("Email:","zeenathtc961@gmail.com", 30),
// //                         Gap(10),
// //                         rowWidget("Phone:", "7306706964", 30),
// //                         Gap(10),
// //                         rowWidget("Address:", "Pallikkal Bazar, Malappuram - 673638", 10),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
      
// //             ],
// //           ),
// //         ),
// //       ),

// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/View/UserBooking/userbookingWidget.dart';
// import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

// class BookingDetailPage extends StatefulWidget {
//   final Map<String, String> booking;

//   const BookingDetailPage({super.key, required this.booking});

//   @override
//   State<BookingDetailPage> createState() => _BookingDetailPageState();
// }

// class _BookingDetailPageState extends State<BookingDetailPage> {
//   bool isCustomerDetailsExpanded = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF718355),
//       body: Column(
//         children: [
//           const Gap(30), // Space at the top with green background
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
//                               "Booking Details",
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
//                           IconButton(
//                             icon: icon(Icons.arrow_back, const Color(0xFF5A5A5A)),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                         ],
//                       ),
//                       const Gap(20),
//                       Card(
//                         color: Colors.white,
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               rowWidget("Device:", "${widget.booking['device']}", 20),
//                               const Gap(10),
//                               rowWidget("Service:", "${widget.booking['service']}", 20),
//                               const Gap(10),
//                               rowWidget("Date:", "${widget.booking['date']}", 20),
//                               const Gap(10),
//                               rowWidget("Status:", "${widget.booking['status']}", 20, color: const Color(0xFF718355)),
//                               const Gap(10),
//                               rowWidget("Technician:", "${widget.booking['technician']}", 20),
//                               const Gap(10),
//                               rowWidget("Payment:", "${widget.booking['payment']}", 20),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Gap(30),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Text(
//                           'Cost Breakdown',
//                           style: GoogleFonts.poppins(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFF2E2E2E),
//                           ),
//                         ),
//                       ),
//                       const Gap(15),
//                       bulletText('Service Charge: ₹399', const Color(0xFF5A5A5A), 16, FontWeight.w400),
//                       const Gap(10),
//                       bulletText('Travel Allowance: ₹157.43', const Color(0xFF5A5A5A), 16, FontWeight.w400),
//                       const Gap(10),
//                       bulletText('Booking Charge: ₹199', const Color(0xFF5A5A5A), 16, FontWeight.w400),
//                       const Gap(10),
//                       bulletText('Total Cost: ₹755.43', const Color(0xFF2E2E2E), 18, FontWeight.w600),
//                       const Gap(30),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               isCustomerDetailsExpanded = !isCustomerDetailsExpanded;
//                             });
//                           },
//                           child: Row(
//                             children: [
//                               Text(
//                                 isCustomerDetailsExpanded ? "Show Customer Details" : "Hide Details",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: const Color(0xFF718355),
//                                 ),
//                               ),
//                               Icon(
//                                 isCustomerDetailsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
//                                 color: const Color(0xFF718355),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const Gap(10),
//                       if (!isCustomerDetailsExpanded)
//                         Card(
//                           color: Colors.white,
//                           elevation: 2,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Customer Details',
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                     color: const Color(0xFF2E2E2E),
//                                   ),
//                                 ),
//                                 const Gap(15),
//                                 rowWidget("Name:", "Zeenath", 20),
//                                 const Gap(10),
//                                 rowWidget("Email:", "zeenathtc961@gmail.com", 20),
//                                 const Gap(10),
//                                 rowWidget("Phone:", "7306706964", 20),
//                                 const Gap(10),
//                                 rowWidget("Address:", "Pallikkal Bazar, Malappuram - 673638", 20),
//                               ],
//                             ),
//                           ),
//                         ),
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

// Widget rowWidget(String text1, String text2, double gap, {Color color = const Color(0xFF2E2E2E)}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Row(
//       children: [
//         Text(
//           text1,
//           style: GoogleFonts.poppins(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFF5A5A5A),
//           ),
//         ),
//         Gap(gap),
//         Expanded(
//           child: Text(
//             text2,
//             style: GoogleFonts.openSans(
//               fontSize: 16,
//               fontWeight: FontWeight.w400,
//               color: color,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget bulletText(String content, Color color, double size, FontWeight fontWeight) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Icon(Icons.circle, size: 8, color: color),
//         const Gap(10),
//         Expanded(
//           child: Text(
//             content,
//             style: GoogleFonts.openSans(
//               color: color,
//               fontSize: size,
//               fontWeight: fontWeight,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }