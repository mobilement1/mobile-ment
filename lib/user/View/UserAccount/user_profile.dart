import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserAccount/accountwidget.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  text('My Account', Color(0xFF61DAFB), 30, FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
              CircleAvatar(
                backgroundImage: AssetImage('asset/prf1.png'),
                radius: 60,
              ),
              text("Zeenath", Colors.white, 25, FontWeight.bold),
              text('zeenathtc961@gmail.com', Colors.blue, 18, FontWeight.bold),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                containerStyle(130, 130, const Color(0x3361DAFB), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    text('12', Colors.white, 30, FontWeight.bold),
                    text('   Total\n Repairs', const Color.fromARGB(255, 174, 173, 173), 20, FontWeight.normal)
                    
                  ],),
                )),
                Gap(20),
                containerStyle(130, 130 , const Color(0x3361DAFB), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    text('2', Colors.white, 30, FontWeight.bold),
                      text('Active\nOrders', const Color.fromARGB(255, 174, 173, 173), 20, FontWeight.normal)
                      
                  ],),
                ))
              ],),
              Gap(20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text('Current Repair', Colors.white, 25, FontWeight.bold)),
                   
              containerStyle(130, double.infinity, const Color(0x3361DAFB), Row(children: [
                Image.asset('asset/iphone-removebg-preview.png',height: 80,
                      width: 80,
                      fit: BoxFit.cover,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        text('iPhone 13 Screen Repair', Colors.white, 22, FontWeight.bold),
                        Gap(10),
                        text('Estimated : 2 Hours', Colors.grey, 18, FontWeight.normal),
                      ],)
              ],)),
              Gap(10),
              Align(
                      alignment: Alignment.topLeft,
                      child: text('Account Details', Colors.white, 25, FontWeight.bold)),

                      containerStyle(250, double.infinity,  const Color(0x3361DAFB), Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          accountRow(Icons.phone, '7306706964'),
                                            const Divider(color: Color.fromARGB(255, 118, 118, 118),),
                                            accountRow(Icons.email, 'zeenathtc961@gmail.com'),
                                            const Divider(color: Color.fromARGB(255, 118, 118, 118),),
                                            accountRow(Icons.location_on, 'Malappuram, Kerala'),
                        ],),
                      )),
                      Gap(15),
                      Align(
                      alignment: Alignment.topLeft,
                      child: text('Settings', Colors.white, 25, FontWeight.bold)),
                        containerStyle(250, double.infinity,  const Color(0x3361DAFB), Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          accountRow(Icons.notification_important, 'Notifications'),
                                            const Divider(color: Color.fromARGB(255, 118, 118, 118),),
                                            accountRow(Icons.settings, 'Settings'),
                                            const Divider(color: Color.fromARGB(255, 118, 118, 118),),
                                            accountRow(Icons.help, 'About Us'),
                        ],),
                      )),
            ],),
          ),
        )),
    );
  }
}