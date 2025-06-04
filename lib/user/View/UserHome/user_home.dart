import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/View/UserService/user_service.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/utils/utils.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () => _slideController.forward());
    Future.delayed(const Duration(milliseconds: 400), () => _scaleController.forward());
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
      
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(_fadeAnimation),
              Expanded(
                child: MainContentSection(
                  slideAnimation: _slideAnimation,
                  scaleAnimation: _scaleAnimation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MainContentSection extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;

  const MainContentSection({
    required this.slideAnimation,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: Container(
        decoration: ColorStyle.mainContentDecoration,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: ColorStyle.neumorphicCardDecoration,
      child:LottieBuilder.asset("asset/lottieimg.json")
       )
                ),
                const Gap(32),
                   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(TextConstants.quikActions, Color(0xFF2E2E2E), 24, FontWeight.w700),
      Gap(4),
      text(TextConstants.access, Color(0xFF5A5A5A), 16, FontWeight.w400),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: ActionCard(
                TextConstants.book,
               TextConstants.sheduled,
                Icons.calendar_today_outlined,
               LinearGradient(
    colors: [Color(0xFF718355), Color(0xFF8B9D7A)],
  ),
                () => Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const BookRepairPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                ),
                false
              ),
            ),
            const Gap(16),
            Expanded(
              child: ActionCard(
                TextConstants.view,
             TextConstants.viewSer ,
                Icons.visibility_outlined,
                
                null,
                () => Navigator.push(
                  context,MaterialPageRoute(builder: (ctx)=>UserService(showBackButton: true,))
                  
                ),
                true
              ),
            ),
          ],
        ),
      ],
    ),
             
                const Gap(32),
                FeaturesSection(),
                const Gap(40),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}




  