import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/controller/bookingprovider.dart';
import 'package:mobile_servies/admin/controller/completedOrder_Provider.dart';
import 'package:mobile_servies/admin/controller/tech_rqst_provider.dart';
import 'package:mobile_servies/admin/controller/technicianList_provider.dart';
import 'package:mobile_servies/admin/service/completed_order_admin_service.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/tech/controller/completed_provider.dart';
import 'package:mobile_servies/tech/controller/providers/Bottomnavbar_provider.dart';
import 'package:mobile_servies/tech/controller/providers/Profilestatus_provider.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/controller/providers/dashboard_provider.dart';
import 'package:mobile_servies/tech/controller/providers/inProgress_provider.dart';
import 'package:mobile_servies/tech/controller/providers/profile_provider.dart';
import 'package:mobile_servies/tech/view/bottomNav/bottom_nav.dart';
import 'package:mobile_servies/user/View/UserBottom/user_bottom.dart';
import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/View/UserRegister/user_register.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:mobile_servies/user/controller/techReqstProvider.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final String? token = await prefs.getString('auth_token');
  final String? role = await prefs.getString('user_role');

  runApp(MyApp(initialToken: token, initialRole: role));
}

class MyApp extends StatelessWidget {
  final String? initialToken;
  final String? initialRole;

  const MyApp({super.key, this.initialToken, this.initialRole});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => TechNavigationProvider()),
        ChangeNotifierProvider(create: (context) => AssignedTechProvider(),) ,
        ChangeNotifierProvider(create: (context)=>UserAuthProvider()),
        ChangeNotifierProvider(create: (context)=>AssistiveTouchFabProvider()),
        ChangeNotifierProvider(create: (context)=>TechnicianApplicationProvider()),
        ChangeNotifierProvider(create: (context)=>TechnicianRequestProvider()),
        ChangeNotifierProvider(create: (context)=>TechnicianListProvider()),
        ChangeNotifierProvider(create: (context)=>CompletedorderProvider(CompletedOrderService(dio: Dio(), baseURL: ApiConstants.baseURL))..fetchCompletedOrders()),
        ChangeNotifierProvider(create: (context) => BookingProvider()),  
        ChangeNotifierProvider(create: (context) => InProgressTechProvider()),
        ChangeNotifierProvider(create: (context) => CompletedTechProvider()),
        ChangeNotifierProvider(create: (context) => TechnicianProfileProvider()),
        ChangeNotifierProvider(create: (context) => DashboardProvider()),
    ],
      child: MaterialApp(
           debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 85, 105, 53),
       
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: initialToken != null && initialToken!.isNotEmpty
            ? (initialRole == 'Technician'
                ? BottomNavTech()
                : initialRole == 'Admin'
                    ? Dashbordpage()
                    : UserBottom())
            : UserLogin(),
        routes: {
          '/login': (context) => UserLogin(),
          '/user-home': (context) => UserBottom(),
          '/technician-home': (context) => BottomNavTech(),
          '/admin-dashboard': (context) => Dashbordpage(),
          '/register': (context) => const UserRegister(),
        },
      ),
    );
  }
}