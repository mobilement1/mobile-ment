// // // import 'package:flutter/material.dart';
// // // import 'package:mobile_servies/tech/constants/colors.dart';
// // // import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
// // // import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';

// // // Widget text(String text,Color color,double size,FontWeight fontWeight){
// // //   return Text(text,style: TextStyle(color: color,
// // //   fontSize: size,
// // //   fontWeight: fontWeight),);
// // // }
// // // Widget icon(IconData icon,Color color){
// // //   return Icon(icon,color:color);
// // // }


// // // Widget customButton({
// // //   required String label,
// // //   required VoidCallback onPressed,
// // //   IconData? icon,
// // //   bool hasBorder = false,
// // // }) {
// // //   return ElevatedButton(
// // //     style: ElevatedButton.styleFrom(
// // //       backgroundColor: const Color(0x3361DAFB),
// // //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //       shape: RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.circular(20),
// // //         side: hasBorder ? const BorderSide(color: Colors.black) : BorderSide.none,
// // //       ),
// // //     ),
// // //     onPressed: onPressed,
// // //     child: Row(
// // //       mainAxisSize: MainAxisSize.min,
// // //       children: [
// // //         Text(
// // //           label,
// // //           style: const TextStyle(
// // //             color: Colors.white,
// // //             fontWeight: FontWeight.bold,
// // //             fontSize: 15,
// // //           ),
// // //         ),
// // //         icon != null
// // //             ? Row(
// // //                 children: [
// // //                   const SizedBox(width: 10),
// // //                   Icon(icon, color: Colors.white),
// // //                 ],
// // //               )
// // //             : Container(), 
// // //       ],
// // //     ),
// // //   );
// // // }



// // // // Become technician side text form fields


// // // Widget TechTextField(String hintText, {int maxLines = 1}) {
// // //     return TextFormField(
// // //       maxLines: maxLines,
// // //       decoration: InputDecoration(
// // //         hintText: hintText,
// // //         hintStyle: const TextStyle(color: Colors.grey),
// // //         filled: true,
// // //         fillColor: const Color(0xFF2A2A2A),
// // //         border: OutlineInputBorder(
// // //           borderRadius: BorderRadius.circular(10),
// // //           borderSide: BorderSide.none,
// // //         ),
// // //       ),
// // //       style: const TextStyle(color: AppColors.whiteClr),
// // //     );
// // //   }


// // // // logout alert dialogue


// // //   void showLogoutDialog(BuildContext context, UserAuthProvider authProvider) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (ctx) => AlertDialog(
// // //         backgroundColor: const Color(0xFF1E1E2E),
// // //         shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(16),
// // //         ),
// // //         title: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             const Text(
// // //               "Confirm Logout",
// // //               style: TextStyle(
// // //                 color: Colors.white,
// // //                 fontWeight: FontWeight.bold,
// // //                 fontSize: 22,
// // //               ),
// // //             ),
// // //             IconButton(
// // //               icon: const Icon(Icons.close, color: Colors.white70),
// // //               onPressed: () => Navigator.of(ctx).pop(),
// // //             ),
// // //           ],
// // //         ),
// // //         content: const Text(
// // //           "Are you sure you want to logout?",
// // //           style: TextStyle(
// // //             color: Colors.white70,
// // //             fontSize: 16,
// // //           ),
// // //         ),
// // //         actions: [
// // //           Row(
// // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //             children: [
// // //               Expanded(
// // //                 child: Container(
// // //                   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: AppColors.darkBluePurple,
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                       padding: const EdgeInsets.symmetric(vertical: 12),
// // //                     ),
// // //                     onPressed: () => Navigator.of(ctx).pop(),
// // //                     child: const Text(
// // //                       "Cancel",
// // //                       style: TextStyle(
// // //                         color: Colors.white,
// // //                         fontWeight: FontWeight.w600,
// // //                         fontSize: 16,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //               Expanded(
// // //                 child: Container(
// // //                   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: AppColors.red, // Red for Logout
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                       padding: const EdgeInsets.symmetric(vertical: 12),
// // //                     ),
// // //                     onPressed: () {
// // //                       Navigator.of(ctx).pop();
// // //                       authProvider.logoutUser();
// // //                       Navigator.pushAndRemoveUntil(
// // //                         context,
// // //                         MaterialPageRoute(builder: (ctx) =>  UserLogin()),
// // //                         (route) => false,
// // //                       );
// // //                     },
// // //                     child: const Text(
// // //                       "Logout",
// // //                       style: TextStyle(
// // //                         color: Colors.white,
// // //                         fontWeight: FontWeight.w600,
// // //                         fontSize: 16,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }



// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/tech/constants/colors.dart';
// import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
// import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';

// Widget text(String text, Color color, double size, FontWeight fontWeight) {
//   return Text(
//     text,
//     style: GoogleFonts.poppins(
//       color: color,
//       fontSize: size,
//       fontWeight: fontWeight,
//     ),
//   );
// }

// Widget icon(IconData icon, Color color) {
//   return Icon(icon, color: color);
// }

// Widget customButton({
//   required String label,
//   required VoidCallback onPressed,
//   IconData? icon,
//   bool hasBorder = false,
// }) {
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//         side: hasBorder ? const BorderSide(color: Color(0xFF2E2E2E)) : BorderSide.none,
//       ),
//     ),
//     onPressed: onPressed,
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           label,
//           style: GoogleFonts.poppins(
//             color: const Color(0xFF718355),
//             fontWeight: FontWeight.w600,
//             fontSize: 15,
//           ),
//         ),
//         icon != null
//             ? Row(
//                 children: [
//                   const Gap(10),
//                   Icon(icon, color: const Color(0xFF718355)),
//                 ],
//               )
//             : Container(),
//       ],
//     ),
//   );
// }

// Widget TechTextField(String hintText, {int maxLines = 1}) {
//   return TextFormField(
//     maxLines: maxLines,
//     decoration: InputDecoration(
//       hintText: hintText,
//       hintStyle: GoogleFonts.openSans(
//         color: const Color(0xFF8D8D8D),
//       ),
//       filled: true,
//       fillColor: Colors.white,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: BorderSide.none,
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
//       ),
//     ),
//     style: GoogleFonts.openSans(
//       color: const Color(0xFF2E2E2E),
//     ),
//   );
// }

// void showLogoutDialog(BuildContext context, UserAuthProvider authProvider) {
//   showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       backgroundColor: const Color(0xFF1E1E2E),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             "Confirm Logout",
//             style: GoogleFonts.poppins(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.close, color: Colors.white70),
//             onPressed: () => Navigator.of(ctx).pop(),
//           ),
//         ],
//       ),
//       content: Text(
//         "Are you sure you want to logout?",
//         style: GoogleFonts.openSans(
//           color: Colors.white70,
//           fontSize: 16,
//         ),
//       ),
//       actions: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF718355),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                   ),
//                   onPressed: () => Navigator.of(ctx).pop(),
//                   child: Text(
//                     "Cancel",
//                     style: GoogleFonts.poppins(
//                       color: const Color(0xFFF5F5F5),
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF8D6E63),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                   ),
//                   onPressed: () {
//                     Navigator.of(ctx).pop();
//                     authProvider.logoutUser();
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (ctx) =>  UserLogin()),
//                       (route) => false,
//                     );
//                   },
//                   child: Text(
//                     "Logout",
//                     style: GoogleFonts.poppins(
//                       color: const Color(0xFFF5F5F5),
//                       fontWeight: FontWeight.w600,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }