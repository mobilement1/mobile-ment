import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/controller/bookingprovider.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/tech/controller/providers/Bottomnavbar_provider.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/screens/bottomNav/bottom_nav.dart';
import 'package:mobile_servies/user/View/splashscreen/splash.dart';
import 'package:provider/provider.dart';

import 'package:mobile_servies/user/View/StartScreen/start.dart';

import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';




void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TechNavigationProvider()),
        ChangeNotifierProvider(create: (context) => AssignedTechProvider(),) ,
        ChangeNotifierProvider(create: (context) => BookingProvider()),
        ChangeNotifierProvider(create: (context)=>UserAuthProvider())

      ],
     
        
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFF1E1E2E),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF181850),
              elevation: 0,
            ),
          ),

          title: 'Flutter Demo',
          home: BottomNavTech()),
    );
  }
}
