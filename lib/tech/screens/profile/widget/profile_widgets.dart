import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';

Widget rowWithText({String? txt, IconData? icn}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
    child: Row(
      
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icn, color: AppColors.blue, size: 24),
        const SizedBox(width: 10),
        Text(
          txt ?? "",
          style: const TextStyle(
            color: AppColors.whiteClr,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}



// Specialisation WIdget

class SpecialisationWidget extends StatelessWidget {
  const SpecialisationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        Chip(
          label: Text(
            "Smartphone Repair",
            style: TextStyle(color: AppColors.whiteClr),
          ),
          backgroundColor: Color.fromARGB(255, 47, 47, 58),
          avatar: Icon(Icons.smartphone, color: AppColors.blue),
        ),
        Chip(
          label: Text(
            "Laptop Service",
            style: TextStyle(color: AppColors.whiteClr),
          ),
          backgroundColor: Color.fromARGB(255, 47, 47, 58),
          avatar: Icon(Icons.laptop, color: AppColors.blue),
        ),
        Chip(
          label: Text(
            "Network Setup",
            style: TextStyle(color: AppColors.whiteClr),
          ),
          backgroundColor: Color.fromARGB(255, 47, 47, 58),
          avatar: Icon(Icons.wifi, color: AppColors.blue),
        ),
        Chip(
          label: Text(
            "Hardware Installation",
            style: TextStyle(color: AppColors.whiteClr),
          ),
          backgroundColor: Color.fromARGB(255, 47, 47, 58),
          avatar: Icon(Icons.computer, color: AppColors.blue),
        ),
      ],
    );
  }
}


// jobs done ,ratings,experience

Widget jobsDoneRatingsExperience({
  required String title,
  required String subtitle,
  bool showIcon = false,
  IconData icon = Icons.star,
}) {
  return Container(
    height: 100,width: 100,decoration: BoxDecoration(
       gradient: const LinearGradient(
                    colors: [AppColors.darkBluePurple, AppColors.justSample],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),borderRadius: BorderRadius.circular(15)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [SizedBox(height: 18,),
        showIcon
            ? Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(width: 10,),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.whiteClr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(icon, color: AppColors.grey, size: 24),
                ],
              )
            : Text(
                title,
                style: const TextStyle(
                  color: AppColors.whiteClr,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
