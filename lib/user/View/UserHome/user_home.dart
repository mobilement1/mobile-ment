
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/constants/imageconstants.dart';
import 'package:mobile_servies/constants/textconstants.dart';
import 'package:mobile_servies/decoration/decoration.dart';
import 'package:mobile_servies/user/view/userbookingsection/user_bookingsection.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

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
      // backgroundColor: const Color(0xFF1E1E2E),
      appBar: AppBar(
        // backgroundColor: const Color(0xFF181850),
       
        title: Row(
          children: [
            text(TextConstants.title1, Color(0xFF61DAFB), 30, FontWeight.bold),
            text(TextConstants.title2, Colors.white, 30, FontWeight.bold),
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
              Gap(30),
              containerStyle(
                40,
                220,
                const Color(0xFF61DAFB).withOpacity(0.2),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: text(TextConstants.proffesion, Colors.white, 15,
                      FontWeight.normal),
                ),
              ),
              const Gap(20),
              text(TextConstants.weCome, Colors.white, 30, FontWeight.w900),
              text(TextConstants.fix, Colors.blue, 30, FontWeight.w900),
              Gap(30),
              text(TextConstants.homeOroffice, Colors.white, 15,
                  FontWeight.normal),
              Gap(40),
              Row(
                children: [
                Row(
  children: [
    customButton(
      label: TextConstants.book,
      icon: Icons.arrow_forward,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookRepairPage()));
      },
    ),
    const Gap(10),
    customButton(
      label: TextConstants.view,
      hasBorder: true,
      icon: null,
      onPressed: () {
        // View action
      },
    ),
  ],
),

                  Gap(10),
                 

                ],
              ),
              Gap(30),
              Row(
                children: [
                  icon(Icons.verified_user),
                  text(TextConstants.warranty, Colors.white, 12,
                      FontWeight.normal),
                  Gap(10),
                  icon(Icons.watch_later_rounded),
                  text(TextConstants.repair, Colors.white, 12,
                      FontWeight.normal),
                  Gap(10),
                  icon(Icons.place),
                  text(
                      TextConstants.onsite, Colors.white, 12, FontWeight.normal)
                ],
              ),
              Gap(60),
              CarouselSlider(
                items: imageCarousel.map((imagePath) {
                  return Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 8.0),
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

              Gap(40),
           
            ],
          ),
        ),
      ),
    );
  }
}

