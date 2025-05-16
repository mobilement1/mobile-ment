import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Dashbordpage());
  }
}
