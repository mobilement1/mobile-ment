// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:mobile_servies/tech/constants/colors.dart';
// import 'package:mobile_servies/tech/constants/text.dart';
// import 'package:mobile_servies/tech/view/profile/widget/profile_widgets.dart';
// import 'package:mobile_servies/tech/widgets/drawer.dart';
// import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

// class ProfilePageTech extends StatelessWidget {
//   const ProfilePageTech({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Gap(20),
//             Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//               child: Text(
//                 TextConsts.profile,
//                 style: TextStyle(
//                   color: AppColors.whiteClr,
//                   fontSize: 28,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: const Color(0xFF718355)),
//                   color: const Color.fromARGB(255, 255, 255, 255),
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Center(
//                               child: CircleAvatar(
//                                 radius: 70,
//                                 child: Icon(
//                                   Icons.person_rounded,
//                                   size: 115,
//                                   color: AppColors.whiteClr,
//                                 ),
//                                 backgroundColor: AppColors.grey,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Center(
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         TextConsts.johnAnderson,
//                                         style: TextStyle(
//                                           color: const Color.fromARGB(
//                                               255, 0, 0, 0),
//                                           fontSize: 24,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 5),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.location_on_outlined,
//                                         color: AppColors.grey,
//                                         size: 20,
//                                       ),
//                                       const SizedBox(width: 5),
//                                       Text(
//                                         TextConsts.kakkancheriMalappuram,
//                                         style: TextStyle(
//                                           color: const Color.fromARGB(
//                                               179, 67, 67, 67),
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Icon(
//                                         Icons.circle,
//                                         color: AppColors.green,
//                                         size: 13,
//                                       ),
//                                       text("Online", Colors.grey, 16,
//                                           FontWeight.w500)
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 20),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 jobsDoneRatingsExperience(
//                                   title: TextConsts.jobsDoneCountProfile,
//                                   subtitle: TextConsts.jobsDone,
//                                 ),
//                                 jobsDoneRatingsExperience(
//                                   title: TextConsts.ratingsProfile,
//                                   subtitle: TextConsts.ratings,
//                                   showIcon: true,
//                                   icon: Icons.star,
//                                 ),
//                                 jobsDoneRatingsExperience(
//                                     title: "5", subtitle:"Experience" ),
                                    
//                               ],
//                             ),SizedBox(height: 30,),
//                            text("Specialized Skills", Color.fromARGB(255, 88, 88, 88),20, FontWeight.bold),
//                            SpecialisationWidget(),
//                             const SizedBox(height: 20),
//                             const SizedBox(height: 10),
//                             const SizedBox(height: 20),
//                             Text(
//                               TextConsts.currentAvailabilty,
//                               style: TextStyle(
//                                 color: const Color.fromARGB(255, 88, 88, 88),
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.access_time,
//                                   color: AppColors.grey,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   TextConsts.monFri,
//                                   style: TextStyle(
//                                     color:
//                                         const Color.fromARGB(255, 88, 88, 88),
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.chat_bubble_outline,
//                                   color: AppColors.grey,
//                                   size: 20,
//                                 ),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   TextConsts.usuallyRespondsin30minutes,
//                                   style: TextStyle(
//                                     color:
//                                         const Color.fromARGB(255, 88, 88, 88),
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const AssistiveTouchFab(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/controller/providers/profile_provider.dart';
import 'package:mobile_servies/tech/view/profile/widget/profile_widgets.dart';
import 'package:mobile_servies/tech/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ProfilePageTech extends StatelessWidget {
  const ProfilePageTech({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the TechnicianProfileProvider
    final profileProvider = Provider.of<TechnicianProfileProvider>(context, listen: false);

    // Load profile data when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (profileProvider.profile == null && !profileProvider.isLoading) {
        profileProvider.loadProfile();
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(
                TextConsts.profile,
                style: TextStyle(
                  color: AppColors.whiteClr,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF718355)),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Stack(
                  children: [
                    Consumer<TechnicianProfileProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (provider.profile == null) {
                          return const Center(child: Text('Failed to load profile'));
                        } else {
                          final profile = provider.profile!;
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 70,
                                      child: Icon(
                                        Icons.person_rounded,
                                        size: 115,
                                        color: AppColors.whiteClr,
                                      ),
                                      backgroundColor: AppColors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          profile.name,
                                          style: const TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        // Placeholder for location (not in model)
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: AppColors.grey,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              'Location not available', // Replace with actual data if added to model
                                              style: TextStyle(
                                                color: const Color.fromARGB(179, 67, 67, 67),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: profile.status.toLowerCase() == 'online'
                                                  ? AppColors.green
                                                  : AppColors.grey,
                                              size: 13,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              profile.status,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Role: ${profile.role}',
                                          style: TextStyle(
                                            color: const Color.fromARGB(179, 67, 67, 67),
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          'Technician ID: ${profile.technicianId}',
                                          style: TextStyle(
                                            color: const Color.fromARGB(179, 67, 67, 67),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  // Placeholder for jobs, ratings, experience (not in model)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      jobsDoneRatingsExperience(
                                        title: 'N/A',
                                        subtitle: TextConsts.jobsDone,
                                      ),
                                      jobsDoneRatingsExperience(
                                        title: 'N/A',
                                        subtitle: TextConsts.ratings,
                                        showIcon: true,
                                        icon: Icons.star,
                                      ),
                                      jobsDoneRatingsExperience(
                                        title: 'N/A',
                                        subtitle: 'Experience',
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    'Specialized Skills',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SpecialisationWidget(), // Assuming this is static or updated separately
                                  const SizedBox(height: 20),
                                  Text(
                                    TextConsts.currentAvailabilty,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 255),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Placeholder for availability (not in model)
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                        color: AppColors.grey,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        'Availability not specified',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 88, 88, 88),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                      children: [
                                        const Icon(
                                          Icons.chat_bubble_outline,
                                          color: AppColors.grey,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          'Response time not specified',
                                          style: TextStyle(
                                            color: Color.fromARGB(255, 88, 88, 88),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const AssistiveTouchFab(),
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