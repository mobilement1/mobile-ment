// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';

// // import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
// // import 'package:mobile_servies/user/View/UserRegister/user_register.dart';
// // import 'package:mobile_servies/user/constants/imageconstants.dart';
// // import 'package:mobile_servies/user/constants/textconstants.dart';
// // import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';

// // class StartScreen extends StatelessWidget {
// //   const StartScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 32.0),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Icon(Icons.build_circle, color: Colors.white, size: 40),
// //                     SizedBox(width: 10),
// //                     text(TextConstants.mobilemend, Colors.white, 26, FontWeight.bold),
                    
// //                    Gap(10),
// //                     Icon(Icons.build_circle, color: Colors.white, size: 40),
// //                   ],
// //                 ),
// //                 SizedBox(height: 40),

// //     text(TextConstants.welcome, Colors.white, 22, FontWeight.bold),
                
// //                 SizedBox(height: 40),

                
// //                 InkWell(
// //                   onTap: () {
// //                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLogin()));
// //                   },
// //                   child: Container(
// //                     width: double.infinity,
// //                     height: 50,
// //                     decoration: BoxDecoration(
// //                       gradient: LinearGradient(
// //                         colors: [
// //                           Color.fromARGB(255, 13, 58, 105),
// //                           Color.fromARGB(255, 41, 41, 41)
// //                         ],
// //                         begin: Alignment.topLeft,
// //                         end: Alignment.bottomRight,
// //                       ),
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     alignment: Alignment.center,
// //                     child: text(
// //                       TextConstants.signin,
                     
// //                         Colors.white,
// //                         16,
// //                        FontWeight.bold,
                     
                    
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 15),

// //                 // Sign Up Button
// //                 ElevatedButton(
// //                   onPressed: () {
// //                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserRegister()));
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.white,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     minimumSize: Size(double.infinity, 50),
// //                   ),
// //                   child: text(TextConstants.sighup, Colors.black, 16, FontWeight.bold),
// //                 ),
// //                 Gap(50),

             
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: Divider(color: Colors.white24, thickness: 2),
// //                     ),
// //                     Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 10),
// //                       child: Text(
// //                         'OR',
// //                         style: TextStyle(color: Colors.white70),
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Divider(color: Colors.white24, thickness: 2),
// //                     ),
// //                   ],
// //                 ),
// //                 Gap(30),

              
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     CircleAvatar(
// //                       radius: 20,
                    
// //                       backgroundImage: AssetImage(Imageconstants.googleLogo),
// //                     ),
// //                     Gap(30),
// //                     CircleAvatar(
// //                         radius: 20,
// //                         backgroundImage: AssetImage(Imageconstants.facebookLogo))
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
// import 'package:mobile_servies/user/View/UserRegister/user_register.dart';
// import 'package:mobile_servies/user/constants/imageconstants.dart';
// import 'package:mobile_servies/user/constants/textconstants.dart';
// import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';

// class StartScreen extends StatelessWidget {
//   const StartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF718355),
//       body: Column(
//         children: [
//           const Gap(40), // Space at the top with green background
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.build_circle,
//                   color: const Color(0xFFF5F5F5),
//                   size: 40,
//                 ),
//                 const Gap(10),
//                 Text(
//                   TextConstants.mobilemend,
//                   style: GoogleFonts.poppins(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w700,
//                     color: const Color(0xFFF5F5F5),
//                     letterSpacing: 0.5,
//                     shadows: [
//                       Shadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         offset: const Offset(2, 2),
//                         blurRadius: 4,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Gap(10),
//                 Icon(
//                   Icons.build_circle,
//                   color: const Color(0xFFF5F5F5),
//                   size: 40,
//                 ),
//               ],
//             ),
//           ),
//           const Gap(20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0),
//             child: Text(
//               TextConstants.welcome,
//               style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w600,
//                 color: const Color(0xFFF5F5F5),
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const Gap(40),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFF5F5F5),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(40),
//                   topLeft: Radius.circular(40),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: customButton(
//                         label: TextConstants.signin,
//                         icon: Icons.login,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) =>  UserLogin()),
//                           );
//                         },
//                       ),
//                     ),
//                     const Gap(15),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: customButton(
//                         label: TextConstants.sighup,
//                         icon: Icons.person_add,
//                         hasBorder: true,
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const UserRegister()),
//                           );
//                         },
//                       ),
//                     ),
//                     const Gap(50),
//                     Row(
//                       children: [
//                         const Expanded(
//                           child: Divider(
//                             color: Color(0xFF8D8D8D),
//                             thickness: 1,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: Text(
//                             'OR',
//                             style: GoogleFonts.openSans(
//                               color: const Color(0xFF5A5A5A),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         const Expanded(
//                           child: Divider(
//                             color: Color(0xFF8D8D8D),
//                             thickness: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Gap(30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Add Google login functionality here
//                           },
//                           child: CircleAvatar(
//                             radius: 20,
//                             backgroundColor: Colors.white,
//                             child: ClipOval(
//                               child: Image.asset(
//                                 Imageconstants.googleLogo,
//                                 width: 30,
//                                 height: 30,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Gap(30),
//                         GestureDetector(
//                           onTap: () {
//                             // Add Facebook login functionality here
//                           },
//                           child: CircleAvatar(
//                             radius: 20,
//                             backgroundColor: Colors.white,
//                             child: ClipOval(
//                               child: Image.asset(
//                                 Imageconstants.facebookLogo,
//                                 width: 30,
//                                 height: 30,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }