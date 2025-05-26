import 'package:flutter/material.dart';
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
    // Delay navigation after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("asset/splashimg.jpg"),
      ),
    );
  }

  Future<void> checkLogin() async {
    // Simulate a splash delay
    await Future.delayed(const Duration(seconds: 5));
   if (!mounted) return; 
   final prefs = await SharedPreferences.getInstance();
  final rawToken = prefs.getString('auth_token');
  debugPrint("🔍 [SharedPrefs] raw auth_token = $rawToken");
    // Access the UserAuthProvider without listening for rebuilds
    final authProvider = Provider.of<UserAuthProvider>(context, listen: false);

    // Check if the user is logged in (assumed async function in provider)
    final isLoggedIn = await authProvider.isUserLoggedIn();
     debugPrint("🔍 [Provider] isUserLoggedIn = $isLoggedIn");
if (!mounted) return; 
    // Navigate accordingly
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  UserBottom()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  UserLogin()),
      );
    }
  }
}
