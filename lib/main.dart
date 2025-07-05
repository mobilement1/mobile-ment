import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/controller/add_device_provider.dart';
import 'package:mobile_servies/admin/controller/add_service_provider.dart';
import 'package:mobile_servies/admin/controller/bookingprovider.dart';
import 'package:mobile_servies/admin/controller/completedOrder_Provider.dart';
import 'package:mobile_servies/admin/controller/dashboard_provider.dart';
import 'package:mobile_servies/admin/controller/tech_rqst_provider.dart';
import 'package:mobile_servies/admin/controller/technicianList_provider.dart';
import 'package:mobile_servies/admin/service/completed_order_admin_service.dart';
import 'package:mobile_servies/tech/controller/completed_provider.dart';
import 'package:mobile_servies/tech/controller/providers/Bottomnavbar_provider.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/controller/providers/dashboard_provider.dart';
import 'package:mobile_servies/tech/controller/providers/inProgress_provider.dart';
import 'package:mobile_servies/tech/controller/providers/profile_provider.dart';
import 'package:mobile_servies/tech/controller/providers/profilestatus_provider.dart';
import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/View/splashscreen/splash.dart';
import 'package:mobile_servies/user/constants/constant_api/const_url.dart';
import 'package:mobile_servies/user/controller/techReqstProvider.dart';
import 'package:mobile_servies/user/viewmodel/addressProvider.dart';
import 'package:mobile_servies/user/viewmodel/bookingProvider.dart';
import 'package:mobile_servies/user/viewmodel/estimatedProvider.dart';
import 'package:mobile_servies/user/viewmodel/serviceDeviseProvider.dart';
import 'package:mobile_servies/user/viewmodel/userDeviceProvider.dart';
import 'package:mobile_servies/user/viewmodel/userServiceProvider.dart';
import 'package:provider/provider.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';


final GlobalKey<NavigatorState>navigatorKey=GlobalKey<NavigatorState>();

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
       ChangeNotifierProvider(create: (context)=>BookingProvider()),
        ChangeNotifierProvider(create: (context)=>UserAuthProvider()),
        ChangeNotifierProvider(create: (context)=>Addressprovider()),
        ChangeNotifierProvider(create: (context)=>BookingProviderUser()),
        ChangeNotifierProvider(create: (context)=>DeviceServiceProvider()),
        ChangeNotifierProvider(create: (context)=>UserDeviceProvider()),
        ChangeNotifierProvider(create: (context)=>UserServiceProvider()),
        ChangeNotifierProvider(create: (context)=>Estimatedprovider()),
        ChangeNotifierProvider(create: (context)=>AssistiveTouchFabProvider()),
        ChangeNotifierProvider(create: (context)=>TechnicianApplicationProvider()),
        ChangeNotifierProvider(create: (context)=>TechnicianRequestProvider()),
        ChangeNotifierProvider(create: (context)=>TechnicianListProvider()),
        ChangeNotifierProvider(create: (context)=>CompletedorderProvider(CompletedOrderService(dio: Dio(),baseURL: ApiConstants.baseURL))..fetchCompletedOrders()),
        ChangeNotifierProvider(create: (context)=>InProgressTechProvider()),
        ChangeNotifierProvider(create: (context)=>CompletedTechProvider()),
        ChangeNotifierProvider(create: (context)=>UserProfileProvider()),
        ChangeNotifierProvider(create: (context)=>DeviceProvider()),
        ChangeNotifierProvider(create: (context)=>ServiceProvider()),
        ChangeNotifierProvider(create: (context)=>DashboardProvider()),
        ChangeNotifierProvider(create: (context)=>AdminDashboardProvider()),
      ],
     
        
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 85, 105, 53),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),

        
          home: Splash(),
          routes: {
            '/login':(context)=>UserLogin(),
          },
          ),
    );
  }
}
