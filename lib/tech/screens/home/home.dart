import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/screens/home/notification.dart';
import 'package:mobile_servies/tech/screens/profile/profile_tech.dart';
import 'package:mobile_servies/tech/widgets/appBar.dart';
import 'package:mobile_servies/tech/widgets/barchart.dart';
import 'package:mobile_servies/tech/screens/home/widget/container.dart';
class HomePageTech extends StatelessWidget {
  const HomePageTech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBluePurple,
      appBar: customAppBar([
        IconButton(
         onPressed: () {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) =>  NotificationPageTech(),
  );
},

          icon: const Icon(
            Icons.notifications_none_sharp,
            color: Colors.white70,size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePageTech(),));
          },
            child: Icon(
                Icons.person,
                color: Colors.white70,
                size: 32,
              ),
          ),
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
    
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(
                TextConsts.techDashBoard,
                style: TextStyle(
                  color: AppColors.whiteClr,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeContainers(Icons.currency_rupee_sharp,"Total Revenue","₹ 8,952"),
            homeContainers(Icons.check_circle,"Completed","96"),
          ],
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homeContainers(Icons.assignment,"Assigned","100"),
            homeContainers(Icons.hourglass_empty,"In Progress","4"),
          ],
         ),
    
            SizedBox(height: 20,),  
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 538,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.darkBluePurple, AppColors.justSample],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextConsts.revenueAndCompledtedBookings, 
                        style: TextStyle(
                          fontSize: 25,
                          color: AppColors.whiteClr,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        TextConsts.monthlyRevenueAndbookingCount,
                        style: TextStyle(
                          color: Color.fromARGB(255, 153, 153, 153),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 380,
                        child: CustomBarChart(
                          monthlyData: {
                            "Jan": {"Revenue": 110, "Completed": 55},
                            "Feb": {"Revenue": 90, "Completed": 60},
                            "Mar": {"Revenue": 30, "Completed": 25},
                            "Apr": {"Revenue": 30, "Completed": 5},
                          },
                          colors: [
                            AppColors.greenGraph,
                            AppColors.pinkGraph,
                          ],
                          metrics: ["Revenue", "Completed"],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
