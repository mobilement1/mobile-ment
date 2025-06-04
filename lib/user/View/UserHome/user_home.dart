// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:gap/gap.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:mobile_servies/user/View/UserHome/become_tech.dart';
// // import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
// // import 'package:mobile_servies/user/constants/imageconstants.dart';
// // import 'package:mobile_servies/user/constants/textconstants.dart';
// // import 'package:mobile_servies/user/decoration/decoration.dart';
// // import 'package:mobile_servies/user/view/UserService/user_service.dart';
// // import 'package:mobile_servies/user/view/userbookingsection/user_bookingsection.dart';
// // import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
// // import 'package:provider/provider.dart';

// // class UserHome extends StatefulWidget {
// //   const UserHome({super.key});

// //   @override
// //   State<UserHome> createState() => _UserHomeState();
// // }

// // class _UserHomeState extends State<UserHome> {
// //   final imageCarousel = [
// //     Imageconstants.img1,
// //     Imageconstants.img2,
// //     Imageconstants.img3,
// //     Imageconstants.img4,
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF718355),
// //       body: Column(crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [SizedBox(height: 10,),
// //           Padding(
// //             padding: const EdgeInsets.all(30.0),
// //             child: text(TextConstants.mobilemend, Colors.white.withOpacity(0.9), 30,
// //                 FontWeight.w900),
// //           ),
// //           const Gap(100), // Space at the top with green background
// //           Expanded(
// //             child: Container(
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFFF5F5F5),
// //                 borderRadius: BorderRadius.only(
// //                   topRight: Radius.circular(40),
// //                   topLeft: Radius.circular(40),
// //                 ),
// //               ),
// //               child: SingleChildScrollView(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(20.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Padding(
// //                             padding:
// //                                 const EdgeInsets.symmetric(horizontal: 10.0),
// //                             child: Container(
// //                               color: Color(0xFF97A97C),
// //                               child: Text(
// //                                 "We Come To\nFix your Device",
// //                                 style: GoogleFonts.poppins(
// //                                   fontSize: 34,
// //                                   fontWeight: FontWeight.w700,
// //                                   color: const Color(0xFF2E2E2E),
// //                                   shadows: [
// //                                     Shadow(
// //                                       color: Colors.grey.withOpacity(0.2),
// //                                       offset: const Offset(2, 2),
// //                                       blurRadius: 4,
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                           Consumer<UserAuthProvider>(
// //                             builder: (context, authProvider, child) {
// //                               return PopupMenuButton<String>(
// //                                 icon:
// //                                     icon(Icons.person, const Color(0xFF5A5A5A)),
// //                                 color: Colors.white,
// //                                 shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(15)),
// //                                 onSelected: (value) {
// //                                   if (value == 'logout') {
// //                                     showLogoutDialog(context, authProvider);
// //                                   }
// //                                 },
// //                                 itemBuilder: (BuildContext context) =>
// //                                     <PopupMenuEntry<String>>[
// //                                   PopupMenuItem<String>(
// //                                     value: 'logout',
// //                                     child: Row(
// //                                       children: [
// //                                         icon(Icons.logout,
// //                                             const Color(0xFF2E2E2E)),
// //                                         const Gap(10),
// //                                         text("Logout", const Color(0xFF2E2E2E),
// //                                             16, FontWeight.w600),
// //                                       ],
// //                                     ),
// //                                   ),
// //                                   PopupMenuItem<String>(
// //                                     value: 'technician',
// //                                     child: Row(
// //                                       children: [
// //                                         icon(Icons.build,
// //                                             const Color(0xFF2E2E2E)),
// //                                         const Gap(10),
// //                                         text(
// //                                             "Become Technician",
// //                                             const Color(0xFF2E2E2E),
// //                                             16,
// //                                             FontWeight.w600),
// //                                       ],
// //                                     ),
// //                                     onTap: () {
// //                                       Future.delayed(Duration.zero, () {
// //                                         Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                                 builder: (context) =>
// //                                                     const BecomeTechPage()));
// //                                       });
// //                                     },
// //                                   ),
// //                                 ],
// //                               );
// //                             },
// //                           ),
// //                         ],
// //                       ),
// //                       const Gap(8),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Text(
// //                           "Book Repairs, View Services, and More",
// //                           style: GoogleFonts.openSans(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w400,
// //                             color: const Color(0xFF5A5A5A),
// //                             letterSpacing: 0.2,
// //                           ),
// //                         ),
// //                       ),
// //                       const Gap(30),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Text(
// //                           "Quick Actions",
// //                           style: GoogleFonts.poppins(
// //                             fontSize: 22,
// //                             fontWeight: FontWeight.w600,
// //                             color: const Color(0xFF2E2E2E),
// //                           ),
// //                         ),
// //                       ),
// //                       const Gap(5),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Text(
// //                           "Access your services instantly",
// //                           style: GoogleFonts.openSans(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w400,
// //                             color: const Color(0xFF5A5A5A),
// //                           ),
// //                         ),
// //                       ),
// //                       const Gap(20),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           children: [
// //                             customButton(
// //                               label: TextConstants.book,
// //                               icon: Icons.arrow_forward,
// //                               onPressed: () {
// //                                 Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) =>
// //                                             const BookRepairPage()));
// //                               },
// //                             ),
// //                             const Gap(20),
// //                             customButton(
// //                               label: TextConstants.view,
// //                               hasBorder: true,
// //                               icon: null,
// //                               onPressed: () {
// //                                 Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) =>
// //                                             const UserService()));
// //                               },
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       const Gap(30),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           children: [
// //                             icon(Icons.verified_user, const Color(0xFF718355)),
// //                             const Gap(5),
// //                             Text(
// //                               TextConstants.warranty,
// //                               style: GoogleFonts.openSans(
// //                                 fontSize: 14,
// //                                 fontWeight: FontWeight.w500,
// //                                 color: const Color(0xFF2E2E2E),
// //                               ),
// //                             ),
// //                             const Gap(20),
// //                             icon(Icons.watch_later_rounded,
// //                                 const Color(0xFF718355)),
// //                             const Gap(5),
// //                             Text(
// //                               TextConstants.repair,
// //                               style: GoogleFonts.openSans(
// //                                 fontSize: 14,
// //                                 fontWeight: FontWeight.w500,
// //                                 color: const Color(0xFF2E2E2E),
// //                               ),
// //                             ),
// //                             const Gap(20),
// //                             icon(Icons.place, const Color(0xFF718355)),
// //                             const Gap(5),
// //                             Text(
// //                               TextConstants.onsite,
// //                               style: GoogleFonts.openSans(
// //                                 fontSize: 14,
// //                                 fontWeight: FontWeight.w500,
// //                                 color: const Color(0xFF2E2E2E),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       const Gap(40),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Text(
// //                           "Promotions",
// //                           style: GoogleFonts.poppins(
// //                             fontSize: 22,
// //                             fontWeight: FontWeight.w600,
// //                             color: const Color(0xFF2E2E2E),
// //                           ),
// //                         ),
// //                       ),
// //                       const Gap(5),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: Text(
// //                           "Check out our latest offers",
// //                           style: GoogleFonts.openSans(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w400,
// //                             color: const Color(0xFF5A5A5A),
// //                           ),
// //                         ),
// //                       ),
// //                       const Gap(20),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //                         child: CarouselSlider(
// //                           items: imageCarousel.map((imagePath) {
// //                             return Container(
// //                               decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(15),
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: Colors.grey.withOpacity(0.5),
// //                                     blurRadius: 8,
// //                                     offset: const Offset(0, 4),
// //                                   ),
// //                                 ],
// //                               ),
// //                               child: ClipRRect(
// //                                 borderRadius: BorderRadius.circular(15),
// //                                 child: Image.asset(
// //                                   imagePath,
// //                                   fit: BoxFit.cover,
// //                                   width: double.infinity,
// //                                 ),
// //                               ),
// //                             );
// //                           }).toList(),
// //                           options: CarouselOptions(
// //                             autoPlay: true,
// //                             height: 180,
// //                             enlargeCenterPage: true,
// //                             viewportFraction: 0.8,
// //                             autoPlayAnimationDuration:
// //                                 const Duration(seconds: 1),
// //                           ),
// //                         ),
// //                       ),
// //                       const Gap(40),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection.dart';
// import 'package:mobile_servies/user/View/UserHome/become_tech.dart';
// import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
// import 'package:mobile_servies/user/View/UserService/user_service.dart';
// import 'package:mobile_servies/user/constants/imageconstants.dart';
// import 'package:mobile_servies/user/constants/textconstants.dart';
// import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
// import 'package:provider/provider.dart';

// // Centralized configuration for styles
// class AppStyles {
//   static const gradientBackground = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFF667C51),
//       Color(0xFF718355),
//       Color(0xFF8B9D7A),
//     ],
//     stops: [0.0, 0.5, 1.0],
//   );

//   static const mainContentDecoration = BoxDecoration(
//     color: Color(0xFFF6F7F8),
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(32),
//       topRight: Radius.circular(32),
//     ),
//     boxShadow: [
//       BoxShadow(
//         color: Color(0x1A000000),
//         blurRadius: 20,
//         offset: Offset(0, -5),
//       ),
//     ],
//   );

//   static var neumorphicCardDecoration = BoxDecoration(
//     color: const Color(0xFFF6F7F8),
//     borderRadius: BorderRadius.circular(20),
//     boxShadow: const [
//       BoxShadow(
//         color: Color(0x1A000000),
//         blurRadius: 10,
//         offset: Offset(2, 2),
//       ),
//       BoxShadow(
//         color: Colors.white,
//         blurRadius: 10,
//         offset: Offset(-2, -2),
//       ),
//     ],
//   );

//   static const buttonGradient = LinearGradient(
//     colors: [Color(0xFF718355), Color(0xFF8B9D7A)],
//   );

//   static const textPrimary = Color(0xFF2E2E2E);
//   static const textSecondary = Color(0xFF5A5A5A);
// }

// class UserHome extends StatefulWidget {
//   const UserHome({super.key});

//   @override
//   State<UserHome> createState() => _UserHomeState();
// }

// class _UserHomeState extends State<UserHome> with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late AnimationController _scaleController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _initializeAnimations();
//   }

//   void _initializeAnimations() {
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );
//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     );
//     _scaleController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );

//     _fadeAnimation = CurvedAnimation(
//       parent: _fadeController,
//       curve: Curves.easeInOut,
//     );
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.3),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(
//       parent: _slideController,
//       curve: Curves.easeOutCubic,
//     ));
//     _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
//     );

//     _fadeController.forward();
//     Future.delayed(const Duration(milliseconds: 200), () => _slideController.forward());
//     Future.delayed(const Duration(milliseconds: 400), () => _scaleController.forward());
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     _scaleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         // decoration: AppStyles.gradientBackground,
//         child: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _HeaderSection(fadeAnimation: _fadeAnimation),
//               Expanded(
//                 child: _MainContentSection(
//                   slideAnimation: _slideAnimation,
//                   scaleAnimation: _scaleAnimation,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _HeaderSection extends StatelessWidget {
//   final Animation<double> fadeAnimation;

//   const _HeaderSection({required this.fadeAnimation});

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: fadeAnimation,
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppLogo(),
//                 _ProfileMenu(),
//               ],
//             ),
//             const Gap(16),
//             _HeaderText(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AppLogo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.white.withOpacity(0.2)),
//       ),
//       child: Text(
//         TextConstants.mobilemend,
//         style: GoogleFonts.poppins(
//           fontSize: 24,
//           fontWeight: FontWeight.w800,
//           color: Colors.white,
//           letterSpacing: 1.2,
//         ),
//         semanticsLabel: "MobileMend logo",
//       ),
//     );
//   }
// }

// class _HeaderText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: (bounds) => const LinearGradient(
//         colors: [Colors.white, Color(0xFFE8F5E8)],
//       ).createShader(bounds),
//       child: Text(
//         "Premium Device\nCare Service",
//         style: GoogleFonts.poppins(
//           fontSize: 28,
//           fontWeight: FontWeight.w700,
//           color: Colors.white,
//           height: 1.2,
//         ),
//         semanticsLabel: "Premium Device Care Service",
//       ),
//     );
//   }
// }

// class _ProfileMenu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<UserAuthProvider>(
//       builder: (context, authProvider, child) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.15),
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: Colors.white.withOpacity(0.2)),
//           ),
//           child: PopupMenuButton<String>(
//             icon: const Icon(
//               Icons.person_outline,
//               color: Colors.white,
//               size: 24,
//               semanticLabel: "User profile menu",
//             ),
//             color: Colors.white.withOpacity(0.95),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             onSelected: (value) {
//               if (value == 'logout') {
//                 _showLogoutDialog(context, authProvider);
//               }
//             },
//             itemBuilder: (context) => [
//               _buildMenuItem(
//                 value: 'technician',
//                 icon: Icons.build,
//                 label: "Become Technician",
//                 iconColor: const Color(0xFF718355),
//                 onTap: () => Navigator.push(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) =>
//                         const BecomeTechPage(),
//                     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                       return SlideTransition(
//                         position: Tween<Offset>(
//                           begin: const Offset(1.0, 0.0),
//                           end: Offset.zero,
//                         ).animate(animation),
//                         child: child,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               _buildMenuItem(
//                 value: 'logout',
//                 icon: Icons.logout,
//                 label: "Logout",
//                 iconColor: Colors.red,
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   PopupMenuItem<String> _buildMenuItem({
//     required String value,
//     required IconData icon,
//     required String label,
//     required Color iconColor,
//     VoidCallback? onTap,
//   }) {
//     return PopupMenuItem<String>(
//       value: value,
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.95),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.white.withOpacity(0.3)),
//         ),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: iconColor.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(icon, color: iconColor, size: 18),
//             ),
//             const Gap(12),
//             Text(
//               label,
//               style: GoogleFonts.poppins(
//                 color: AppStyles.textPrimary,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showLogoutDialog(BuildContext context, UserAuthProvider authProvider) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(
//           "Logout",
//           style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
//         ),
//         content: Text(
//           "Are you sure you want to logout?",
//           style: GoogleFonts.openSans(),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(
//               "Cancel",
//               style: GoogleFonts.poppins(color: AppStyles.textSecondary),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               authProvider.logoutUser();
//               Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => UserLogin(),),(route) => false,);
//             },
//             child: Text(
//               "Logout",
//               style: GoogleFonts.poppins(color: Colors.red),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _MainContentSection extends StatelessWidget {
//   final Animation<Offset> slideAnimation;
//   final Animation<double> scaleAnimation;

//   const _MainContentSection({
//     required this.slideAnimation,
//     required this.scaleAnimation,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: slideAnimation,
//       child: Container(
//         decoration: AppStyles.mainContentDecoration,
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ScaleTransition(
//                   scale: scaleAnimation,
//                   child: _HeroSection(),
//                 ),
//                 const Gap(32),
//                 _QuickActionsSection(),
//                 const Gap(32),
//                 _FeaturesSection(),
//                 const Gap(40),
//                 _PromotionsSection(),
//                 const Gap(32),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _HeroSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: AppStyles.neumorphicCardDecoration,
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: const Color(0xFF718355),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: const Icon(
//               Icons.settings,
//               color: Colors.white,
//               size: 24,
//               semanticLabel: "Repair service icon",
//             ),
//           ),
//           const Gap(16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "We Come To Fix Your Device",
//                   style: GoogleFonts.poppins(
//                     fontSize: 24,
//                     fontWeight: FontWeight.w700,
//                     color: AppStyles.textPrimary,
//                     height: 1.2,
//                   ),
//                   semanticsLabel: "Device repair service",
//                 ),
//                 const Gap(8),
//                 Text(
//                   "Professional repairs at your doorstep",
//                   style: GoogleFonts.openSans(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w400,
//                     color: AppStyles.textSecondary,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _QuickActionsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionHeader("Quick Actions", "Access your services instantly"),
//         const Gap(20),
//         Row(
//           children: [
//             Expanded(
//               child: _ActionCard(
//                 title: TextConstants.book,
//                 subtitle: "Schedule Repair",
//                 icon: Icons.calendar_today_outlined,
//                 gradient: AppStyles.buttonGradient,
//                 onTap: () => Navigator.push(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) =>
//                         const BookRepairPage(),
//                     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                       return FadeTransition(opacity: animation, child: child);
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             const Gap(16),
//             Expanded(
//               child: _ActionCard(
//                 title: TextConstants.view,
//                 subtitle: "View Services",
//                 icon: Icons.visibility_outlined,
//                 isOutlined: true,
//                 onTap: () => Navigator.push(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) =>
//                         const UserService(),
//                     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//                       return SlideTransition(
//                         position: Tween<Offset>(
//                           begin: const Offset(0.0, 1.0),
//                           end: Offset.zero,
//                         ).animate(animation),
//                         child: child,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildSectionHeader(String title, String subtitle) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: AppStyles.textPrimary,
//           ),
//           semanticsLabel: title,
//         ),
//         const Gap(4),
//         Text(
//           subtitle,
//           style: GoogleFonts.openSans(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: AppStyles.textSecondary,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _ActionCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final IconData icon;
//   final Gradient? gradient;
//   final VoidCallback onTap;
//   final bool isOutlined;

//   const _ActionCard({
//     required this.title,
//     required this.subtitle,
//     required this.icon,
//     required this.onTap,
//     this.gradient,
//     this.isOutlined = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           gradient: isOutlined ? null : gradient,
//           color: isOutlined ? Colors.white : null,
//           borderRadius: BorderRadius.circular(20),
//           border: isOutlined
//               ? Border.all(color: const Color(0xFF718355), width: 2)
//               : null,
//           boxShadow: [
//             BoxShadow(
//               color: const Color(0xFF718355).withOpacity(0.15),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: isOutlined
//                     ? const Color(0xFF718355).withOpacity(0.1)
//                     : Colors.white.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 icon,
//                 color: isOutlined ? const Color(0xFF718355) : Colors.white,
//                 size: 24,
//                 semanticLabel: title,
//               ),
//             ),
//             const Gap(16),
//             Text(
//               title,
//               style: GoogleFonts.poppins(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: isOutlined ? AppStyles.textPrimary : Colors.white,
//               ),
//             ),
//             const Gap(4),
//             Text(
//               subtitle,
//               style: GoogleFonts.openSans(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//                 color: isOutlined
//                     ? AppStyles.textSecondary
//                     : Colors.white.withOpacity(0.8),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _FeaturesSection extends StatelessWidget {
//   final List<Map<String, dynamic>> features = [
//     {
//       'icon': Icons.verified_user,
//       'text': TextConstants.warranty,
//     },
//     {
//       'icon': Icons.access_time,
//       'text': TextConstants.repair,
//     },
//     {
//       'icon': Icons.location_on,
//       'text': TextConstants.onsite,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: AppStyles.neumorphicCardDecoration,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: features
//             .map((feature) => _FeatureItem(
//                   icon: feature['icon'] as IconData,
//                   text: feature['text'] as String,
//                 ))
//             .toList(),
//       ),
//     );
//   }
// }

// class _FeatureItem extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const _FeatureItem({required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: const Color(0xFF718355).withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(
//             icon,
//             color: const Color(0xFF718355),
//             size: 24,
//             semanticLabel: text,
//           ),
//         ),
//         const Gap(8),
//         Text(
//           text,
//           style: GoogleFonts.openSans(
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//             color: AppStyles.textPrimary,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }

// class _PromotionsSection extends StatelessWidget {
//   final List<String> imageCarousel = [
//     Imageconstants.img1,
//     Imageconstants.img2,
//     Imageconstants.img3,
//     Imageconstants.img4,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionHeader("Promotions", "Check out our latest offers"),
//         const Gap(20),
//         CarouselSlider(
//           items: imageCarousel.map((imagePath) {
//             return _CarouselItem(imagePath: imagePath);
//           }).toList(),
//           options: CarouselOptions(
//             autoPlay: true,
//             height: 200,
//             enlargeCenterPage: true,
//             viewportFraction: 0.85,
//             autoPlayAnimationDuration: const Duration(milliseconds: 1500),
//             autoPlayCurve: Curves.easeInOutCubic,
//             enableInfiniteScroll: true,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSectionHeader(String title, String subtitle) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: GoogleFonts.poppins(
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//             color: AppStyles.textPrimary,
//           ),
//           semanticsLabel: title,
//         ),
//         const Gap(4),
//         Text(
//           subtitle,
//           style: GoogleFonts.openSans(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: AppStyles.textSecondary,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _CarouselItem extends StatelessWidget {
//   final String imagePath;

//   const _CarouselItem({required this.imagePath});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.15),
//             blurRadius: 15,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Stack(
//           children: [
//             Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: double.infinity,
//               height: double.infinity,
//               errorBuilder: (context, error, stackTrace) => Container(
//                 color: Colors.grey[300],
//                 child: const Center(
//                   child: Icon(Icons.error, color: Colors.red, size: 40),
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.transparent,
//                     Colors.black.withOpacity(0.3),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }