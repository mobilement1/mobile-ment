import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserHome/become_tech.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/imageconstants.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
import 'package:mobile_servies/user/view/UserService/user_service.dart';
import 'package:mobile_servies/user/view/userbookingsection/user_bookingsection.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final imageCarousel = [
    Imageconstants.img1,
    Imageconstants.img2,
    Imageconstants.img3,
    Imageconstants.img4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            text(TextConstants.title1, const Color(0xFF61DAFB), 30, FontWeight.bold),
            text(TextConstants.title2, Colors.white, 30, FontWeight.bold),
            const Spacer(),
            Consumer<UserAuthProvider>(
              builder: (context, authProvider, child) {
                return PopupMenuButton<String>(
                  icon: icon(Icons.person, Colors.white),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  onSelected: (value) {
                    if (value == 'logout') {
                      showLogoutDialog(context, authProvider);
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          icon(Icons.logout, Colors.black),
                          const SizedBox(width: 10),
                          text("Logout", Colors.black, 16, FontWeight.bold),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'technician',
                      child: Row(
                        children: [
                          icon(Icons.build, Colors.black),
                          const SizedBox(width: 10),
                          text("Become Technician", Colors.black, 16, FontWeight.bold),
                        ],
                      ),
                      onTap: () {
                        Future.delayed(Duration.zero, () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const BecomeTechPage()));
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              containerStyle(
                40,
                220,
                const Color(0xFF61DAFB).withOpacity(0.2),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: text(TextConstants.proffesion, Colors.white, 15, FontWeight.normal),
                ),
              ),
              const Gap(20),
              text(TextConstants.weCome, Colors.white, 30, FontWeight.w900),
              text(TextConstants.fix, Colors.blue, 30, FontWeight.w900),
              const Gap(30),
              text(TextConstants.homeOroffice, Colors.white, 15, FontWeight.normal),
              const Gap(40),

              // Buttons
              Row(
                children: [
                  customButton(
                    label: TextConstants.book,
                    icon: Icons.arrow_forward,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BookRepairPage()));
                    },
                  ),
                  const Gap(10),
                  customButton(
                    label: TextConstants.view,
                    hasBorder: true,
                    icon: null,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserService()));
                    },
                  ),
                ],
              ),

              const Gap(30),

              // Icons Row
              Row(
                children: [
                  icon(Icons.verified_user, Colors.blue),
                  const Gap(5),
                  text(TextConstants.warranty, Colors.white, 12, FontWeight.normal),
                  const Gap(10),
                  icon(Icons.watch_later_rounded, Colors.blue),
                  const Gap(5),
                  text(TextConstants.repair, Colors.white, 12, FontWeight.normal),
                  const Gap(10),
                  icon(Icons.place, Colors.blue),
                  const Gap(5),
                  text(TextConstants.onsite, Colors.white, 12, FontWeight.normal),
                ],
              ),

              const Gap(60),

              // Carousel
              CarouselSlider(
                items: imageCarousel.map((imagePath) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  height: 180,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
              ),

              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
