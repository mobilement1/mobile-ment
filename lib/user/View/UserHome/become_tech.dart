// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:mobile_servies/tech/constants/colors.dart';
// import 'package:mobile_servies/tech/widgets/appBar.dart';
// import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
// import 'package:mobile_servies/user/constants/textconstants.dart';

// class BecomeTechPage extends StatelessWidget {
//   const BecomeTechPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: customAppBar(),
//       backgroundColor: AppColors.darkBluePurple, 
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(  
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Padding( 
                  
//                   padding: const EdgeInsets.all(15.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(width: 10),
//                       Icon(
//                         Icons.engineering,
//                         color: Colors.yellow[300],
//                         size: 35,
//                       ),
//                       const SizedBox(width: 10),
//                       Text(
//                         TextConstants.TechApplication,
//                         style: const TextStyle(
//                           color: AppColors.whiteClr,
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ], 
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Text(
//                     TextConstants.Applytojoinourteamofprofessional,
//                     style: const TextStyle(
//                       color: AppColors.whiteClr,
//                       fontSize: 19,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.start,
//                     softWrap: true,          

//                   ),

//                 ),
//                 const Gap(25),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Text(
//                     TextConstants.ProfessionalInformation,
//                     style: TextStyle(
//                       color: AppColors.whiteClr,
//                       fontSize: 19,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 const Gap(20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Experience", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
//                       TechTextField("How many years of repair experience do you have?"),
//                       const Gap(10),
//                       Text("Specialised Skills", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
//                       TechTextField("e.g., Smartphone Repair, Laptop Repair"),
//                       const Gap(10),
//                       Text("Location", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
//                       TechTextField("Place (e.g., City or Town)"),
//                       const Gap(10),
//                       Text("Description", style: TextStyle(color: AppColors.whiteClr,fontSize: 16,fontWeight: FontWeight.w400,),),
//                       TechTextField("Tell us about yourself and your experience", maxLines: 4),
//                     ],
//                   ),
//                 ),
//                 const Gap(25),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Text(
//                     "Documents",
//                     style: TextStyle(
//                       color: AppColors.whiteClr,
//                       fontSize: 19,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 const Gap(15),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       // upload resume 
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[300],
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(Icons.cloud_upload, color: Colors.black54),
//                           SizedBox(width: 10),
//                           Text(
//                             "Click to upload Resume",
//                             style: TextStyle(
//                               color: Colors.black54,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Gap(25),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // submit functionality 
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, 
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     child: const Text(
//                       "Submit Application",
//                       style: TextStyle(
//                         color: AppColors.whiteClr,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Gap(20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';

class BecomeTechPage extends StatelessWidget {
  const BecomeTechPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF718355),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(30), // Space where the "Mobile Mend" container was
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              icon(Icons.engineering, const Color(0xFF718355)),
                              const Gap(10),
                              Text(
                                TextConstants.TechApplication,
                                style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF2E2E2E),
                                  letterSpacing: 0.5,
                                  shadows: [
                                    Shadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: const Offset(2, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: icon(Icons.arrow_back, const Color(0xFF5A5A5A)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const Gap(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        TextConstants.Applytojoinourteamofprofessional,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF5A5A5A),
                          letterSpacing: 0.2,
                        ),
                        textAlign: TextAlign.start,
                        softWrap: true,
                      ),
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        TextConstants.ProfessionalInformation,
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Provide details about your skills and experience",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF5A5A5A),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Experience",
                            style: GoogleFonts.openSans(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(5),
                          TechTextField("How many years of repair experience do you have?"),
                          const Gap(15),
                          Text(
                            "Specialised Skills",
                            style: GoogleFonts.openSans(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(5),
                          TechTextField("e.g., Smartphone Repair, Laptop Repair"),
                          const Gap(15),
                          Text(
                            "Location",
                            style: GoogleFonts.openSans(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(5),
                          TechTextField("Place (e.g., City or Town)"),
                          const Gap(15),
                          Text(
                            "Description",
                            style: GoogleFonts.openSans(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Gap(5),
                          TechTextField("Tell us about yourself and your experience", maxLines: 4),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Documents",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Upload your resume to support your application",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF5A5A5A),
                        ),
                      ),
                    ),
                    const Gap(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          // upload resume
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF8D8D8D), style: BorderStyle.solid, width: 2),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              icon(Icons.cloud_upload, const Color(0xFF5A5A5A)),
                              const Gap(10),
                              Text(
                                "Click to upload Resume",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF5A5A5A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // submit functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF718355),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Text(
                          "Submit Application",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFF5F5F5),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}