// // import 'package:flutter/material.dart';

// // import 'package:mobile_servies/user/View/UserBooking/user_booking.dart';
// // import 'package:mobile_servies/user/View/UserDevice/user_device.dart';
// // import 'package:mobile_servies/user/View/UserHome/user_home.dart';
// // import 'package:mobile_servies/user/View/UserService/user_service.dart';
// // import 'package:mobile_servies/user/constants/textconstants.dart';
// // import 'package:mobile_servies/user/view/useraccount/user_profile.dart';

// // class UserBottom extends StatefulWidget {
// //   const UserBottom({super.key});

// //   @override
// //   State<UserBottom> createState() => _UserBottomState();
// // }

// // class _UserBottomState extends State<UserBottom> {
// //   int indexNum = 0;

// //   final pages = [
// //     UserHome(),
// //     UserService(),
// //     UserDevice(),
// //     UserBooking(),
// //     UserProfile(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: pages[indexNum],
// //       bottomNavigationBar: BottomNavigationBar(
// //         items: [
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.home), label: TextConstants.home),
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.miscellaneous_services_outlined),
// //               label: TextConstants.service),
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.device_hub), label: TextConstants.device),
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.book), label: TextConstants.booking),
// //           BottomNavigationBarItem(
// //               icon: Icon(Icons.person), label: TextConstants.account),
// //         ],
// //         backgroundColor: const Color(0xFF181850),
// //                type: BottomNavigationBarType.fixed,
// //         unselectedItemColor: Colors.white,
// //         selectedItemColor: const Color(0xFF61DAFB),
// //         showSelectedLabels: true,
// //         currentIndex: indexNum,
// //         onTap: (int index) {
// //           setState(() {
// //             indexNum = index;
// //           });
// //         },
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/View/UserBooking/user_booking.dart';
// import 'package:mobile_servies/user/View/UserDevice/user_device.dart';
// import 'package:mobile_servies/user/View/UserHome/user_home.dart';
// import 'package:mobile_servies/user/View/UserService/user_service.dart';
// import 'package:mobile_servies/user/constants/textconstants.dart';
// import 'package:mobile_servies/user/view/useraccount/user_profile.dart';

// class UserBottom extends StatefulWidget {
//   const UserBottom({super.key});

//   @override
//   State<UserBottom> createState() => _UserBottomState();
// }

// class _UserBottomState extends State<UserBottom> {
//   int indexNum = 0;

//   final pages = [
//     const UserHome(),
//     const UserService(),
//     const UserDevice(),
//     const UserBooking(),
//     const UserProfile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[indexNum],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: const Color(0xFFF5F5F5),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               offset: const Offset(0, -2),
//               blurRadius: 4,
//             ),
//           ],
//           border: const Border(
//             top: BorderSide(
//               color: Color(0xFF8D8D8D),
//               width: 1,
//             ),
//           ),
//         ),
//         child: BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home, size: 28),
//               label: TextConstants.home,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.miscellaneous_services_outlined, size: 28),
//               label: TextConstants.service,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.phone_iphone_rounded, size: 28),
//               label: TextConstants.device,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.book, size: 28),
//               label: TextConstants.booking,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.person, size: 28),
//               label: TextConstants.account,
//             ),
//           ],
//           backgroundColor: Colors.transparent,
//           type: BottomNavigationBarType.fixed,
//           unselectedItemColor: const Color(0xFF5A5A5A),
//           selectedItemColor: const Color(0xFF718355),
//           showSelectedLabels: true,
//           currentIndex: indexNum,
//           onTap: (int index) {
//             setState(() {
//               indexNum = index;
//             });
//           },
//           selectedLabelStyle: GoogleFonts.poppins(
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//           ),
//           unselectedLabelStyle: GoogleFonts.poppins(
//             fontSize: 12,
//             fontWeight: FontWeight.w400,
//           ),
//           elevation: 0, // Elevation is handled by the Container's boxShadow
//         ),
//       ),
//     );
//   }
// }