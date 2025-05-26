import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/screens/assigned/assigned_tech.dart';
import 'package:mobile_servies/tech/screens/completed/completed_tech.dart';
import 'package:mobile_servies/tech/screens/home/home.dart';
import 'package:mobile_servies/tech/screens/inProgress/inProgress_tech.dart';
import 'package:mobile_servies/tech/screens/profile/aboutUS.dart';
import 'package:mobile_servies/tech/screens/profile/privacyPolicy.dart';

Widget TechnicianDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: AppColors.darkBluePurple,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: AppColors.darkBluePurple),
          currentAccountPicture: CircleAvatar(
            backgroundColor: AppColors.grey,
            child: Icon(Icons.person, size: 40, color: AppColors.whiteClr),
          ),
          accountName: Text(
            'John Anderson',
            style: TextStyle(color: AppColors.whiteClr, fontWeight: FontWeight.bold),
          ),
          accountEmail: Text(
            'john@example.com', 
            style: TextStyle(color: AppColors.grey),
          ),
        ),

        tiless(Icons.dashboard, "Dashboard", () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageTech(),));
        }),
        tiless(Icons.assignment, "Assigned", () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AssignedPageTech(),));
        }),
        tiless(Icons.hourglass_empty, "In Progress", () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InprogressTechPagessss(),));
        }),
        tiless(Icons.check_circle, "Completed", () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CompletedPageTech(),));
        }),

        Divider(color: AppColors.grey),

        tiless(Icons.privacy_tip, "Privacy Policy", () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => PrivacypolicyTech(),));
        }),
        tiless(Icons.info, "About Us", () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => AboutUsTech(),));

        }),
        tiless(Icons.logout, "Logout", () {

        }),
      ],
    ),
  );
}


Widget tiless(IconData iconData, String title, ontap) {
  return ListTile(
    leading: Icon(iconData, color: AppColors.whiteClr),
    title: Text(title, style: TextStyle(color: AppColors.whiteClr)),
    onTap: ontap
  );
}
