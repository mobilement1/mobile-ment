import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/tech/controller/completed_provider.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/controller/providers/dashboard_provider.dart';
import 'package:mobile_servies/tech/controller/providers/inProgress_provider.dart';
import 'package:mobile_servies/tech/screens/bottomNav/bottom_nav.dart';
import 'package:mobile_servies/user/View/UserBottom/user_bottom.dart';
import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<InProgressTechProvider>(context, listen: false).initialize();
      Provider.of<CompletedTechProvider>(context, listen: false).initialize();
       Provider.of<AssignedTechProvider>(context, listen: false).initialize();
         Provider.of<DashboardProvider>(context, listen: false).fetchDashboardData();
      checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Center(
        child: Image.asset("asset/splashimg.jpg",height: 400,width: 400,),
      ),
    );
  }

  Future<void> checkLogin() async {
  
    await Future.delayed(const Duration(seconds: 5));
 
   final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('auth_token');
   final userRole = prefs.getString('user_role');
     log(" [SharedPrefs] user_role= $userRole");
  log(" [SharedPrefs]  auth_token = $token");

    final authProvider = Provider.of<UserAuthProvider>(context, listen: false);

  
    final isLoggedIn = await authProvider.isUserLoggedIn();
     log("isUserLoggedIn = $isLoggedIn");

    
    if (token!=null&&token.isNotEmpty) {
      final isExpired=JwtDecoder.isExpired(token);
      log("token expired:$isExpired");
      if (isExpired) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UserLogin()));
      }else{
      if (userRole=='Admin') {
         Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Dashbordpage()), 
      );
      }else if(userRole == 'Technician'){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavTech()));
      }
      
      else{
Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  UserBottom()),
      );
      }
      } 
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  UserLogin()),
      );
    }
  }
}
