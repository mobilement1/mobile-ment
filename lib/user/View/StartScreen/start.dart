import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/View/UserRegister/user_register.dart';
import 'package:mobile_servies/user/constants/imageconstants.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.build_circle, color: Colors.white, size: 40),
                    SizedBox(width: 10),
                    text(TextConstants.mobilemend, Colors.white, 26, FontWeight.bold),
                    
                   Gap(10),
                    Icon(Icons.build_circle, color: Colors.white, size: 40),
                  ],
                ),
                SizedBox(height: 40),

    text(TextConstants.welcome, Colors.white, 22, FontWeight.bold),
                
                SizedBox(height: 40),

                
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLogin()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Color.fromARGB(255, 41, 41, 41)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: text(
                      TextConstants.signin,
                     
                        Colors.white,
                        16,
                       FontWeight.bold,
                     
                    
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>UserRegister()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: text(TextConstants.sighup, Colors.black, 16, FontWeight.bold),
                ),
                Gap(50),

             
                

              
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

