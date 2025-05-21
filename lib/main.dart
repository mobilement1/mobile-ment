import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/controller/providers/Bottomnavbar_provider.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/screens/bottomNav/bottom_nav.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TechNavigationProvider()),
        ChangeNotifierProvider(create: (context) => AssignedTechProvider(),) 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  BottomNavTech(),
      ),
    );
  }
}
