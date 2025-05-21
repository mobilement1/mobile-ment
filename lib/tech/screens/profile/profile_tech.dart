import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/screens/profile/widget/profile_widgets.dart';
import 'package:mobile_servies/tech/widgets/appBar.dart';

class ProfilePageTech extends StatelessWidget {
  const ProfilePageTech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBluePurple,
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(TextConsts.profile,style: TextStyle(
                  color: AppColors.whiteClr,fontSize: 28,fontWeight: FontWeight.w700,), ),
            ),const SizedBox(height: 20),
            Center(
              child: CircleAvatar(radius: 70,
                child: Icon(Icons.person_rounded, size: 115, color: AppColors.whiteClr),backgroundColor: AppColors.grey,),
            ),const SizedBox(height: 10),
            Center(
              child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       TextConsts.johnAnderson,
                        style: TextStyle(color: AppColors.whiteClr,fontSize: 24,fontWeight: FontWeight.bold,),
                      ), const SizedBox(width: 5),
                      Icon(Icons.verified, color: AppColors.blue, size: 20),
                    ],
                  ),const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, color: AppColors.grey, size: 20),const SizedBox(width: 5),
                      Text(TextConsts.kakkancheriMalappuram,style: TextStyle(color: AppColors.grey, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container( padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: AppColors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15), gradient: const LinearGradient(
            colors: [AppColors.justSample, AppColors.darkBluePurple],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
                ),
                child: Column(children: [
                    Row(children: [
                        Container(height: 15,width: 15,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.green,
                          ),
                        ),const SizedBox(width: 10),
                        Text(TextConsts.availableNow,style: TextStyle(color: AppColors.whiteClr, fontSize: 16),
                        ),const Spacer(),
                        Text(TextConsts.online,style: TextStyle(color: AppColors.grey, fontSize: 16), ),
                      ],
                    ),const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(color: AppColors.darkBluePurple,borderRadius: BorderRadius.circular(15),),
                      child: Center(
                        child: Text(TextConsts.changeStatus,
                          style: TextStyle(
                            color: AppColors.whiteClr,fontSize: 20,fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ],
                ),
              ),
            ),const SizedBox(height: 20),
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    jobsDoneRatingsExperience(
      title: TextConsts.jobsDoneCountProfile,
      subtitle: TextConsts.jobsDone,
    ),
    jobsDoneRatingsExperience(
      title: TextConsts.ratingsProfile,
      subtitle: TextConsts.ratings,
      showIcon: true,
      icon: Icons.star,
    ),
    jobsDoneRatingsExperience(
      title: TextConsts.experienceProfile,
      subtitle: TextConsts.experience,
    ),
  ],
),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(
                    TextConsts.specializations,
                    style: TextStyle(color: AppColors.whiteClr,fontSize: 20,fontWeight: FontWeight.bold,),),
                  const SizedBox(height: 10),
                  SpecialisationWidget(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TextConsts.currentAvailabilty,style: TextStyle(color: AppColors.whiteClr,fontSize: 20,fontWeight: FontWeight.bold,),),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: AppColors.grey, size: 20),
                      const SizedBox(width: 5),
                      Text(TextConsts.monFri, style: TextStyle(color: AppColors.whiteClr, fontSize: 16),),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.chat_bubble_outline, color: AppColors.grey, size: 20),
                      const SizedBox(width: 5),
                      Text(TextConsts.usuallyRespondsin30minutes,style: TextStyle(color: AppColors.whiteClr, fontSize: 16),),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
