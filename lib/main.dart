import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/controller/bookingprovider.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/firebase_options.dart';
import 'package:mobile_servies/user/View/StartScreen/start.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookingProvider())
        ChangeNotifierProvider(create: (context)=>UserAuthProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1E1E2E),
          appBarTheme: const AppBarTheme(
            backgroundColor:  Color(0xFF181850), 
            elevation: 0, 
          ),
        ),
          title: 'Flutter Demo',
          home:StartScreen ()),
    );
  }
}
