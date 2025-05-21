import 'package:flutter/material.dart';
import 'package:mobile_servies/constants/textconstants.dart';
import 'package:mobile_servies/user/View/UserBooking/user_booking.dart';
import 'package:mobile_servies/user/View/UserDevice/user_device.dart';
import 'package:mobile_servies/user/View/UserHome/user_home.dart';
import 'package:mobile_servies/user/View/UserService/user_service.dart';
import 'package:mobile_servies/user/view/useraccount/user_profile.dart';

class UserBottom extends StatefulWidget {
  const UserBottom({super.key});

  @override
  State<UserBottom> createState() => _UserBottomState();
}

class _UserBottomState extends State<UserBottom> {
  int indexNum = 0;

  final pages = [
    UserHome(),
    UserService(),
    UserDevice(),
    UserBooking(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexNum],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: TextConstants.home),
          BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services_outlined),
              label: TextConstants.service),
          BottomNavigationBarItem(
              icon: Icon(Icons.device_hub), label: TextConstants.device),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: TextConstants.booking),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: TextConstants.account),
        ],
        backgroundColor: const Color(0xFF181850),
               type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xFF61DAFB),
        showSelectedLabels: true,
        currentIndex: indexNum,
        onTap: (int index) {
          setState(() {
            indexNum = index;
          });
        },
      ),
    );
  }
}
