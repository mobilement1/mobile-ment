import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/appBar.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';

class BecomeTechPage extends StatelessWidget {
  const BecomeTechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: AppColors.darkBluePurple, 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Icon(
                        Icons.engineering,
                        color: Colors.yellow[300],
                        size: 35,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        TextConstants.TechApplication,
                        style: const TextStyle(
                          color: AppColors.whiteClr,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    TextConstants.Applytojoinourteamofprofessional,
                    style: const TextStyle(
                      color: AppColors.whiteClr,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                ),
                const Gap(25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    TextConstants.ProfessionalInformation,
                    style: TextStyle(
                      color: AppColors.whiteClr,
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Experience", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
                      TechTextField("How many years of repair experience do you have?"),
                      const Gap(10),
                      Text("Specialised Skills", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
                      TechTextField("e.g., Smartphone Repair, Laptop Repair"),
                      const Gap(10),
                      Text("Location", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
                      TechTextField("Place (e.g., City or Town)"),
                      const Gap(10),
                      Text("Description", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
                      TechTextField("Tell us about yourself and your experience", maxLines: 4),
                    ],
                  ),
                ),
                const Gap(25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Documents",
                    style: TextStyle(
                      color: AppColors.whiteClr,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      // upload resume 
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.cloud_upload, color: Colors.black54),
                          SizedBox(width: 10),
                          Text(
                            "Click to upload Resume",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // submit functionality 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Submit Application",
                      style: TextStyle(
                        color: AppColors.whiteClr,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}