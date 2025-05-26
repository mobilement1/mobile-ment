import 'package:flutter/material.dart';
import 'package:mobile_servies/constants/text.dart';
import 'package:mobile_servies/constants/textconstants.dart';
import 'package:mobile_servies/tech/constants/colors.dart';

class PrivacypolicyTech extends StatelessWidget {
  const PrivacypolicyTech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBluePurple,
      appBar: AppBar(
        backgroundColor: AppColors.darkBluePurple,
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: AppColors.whiteClr),
        ),
        iconTheme: IconThemeData(color: AppColors.whiteClr),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text( TextConsts.privacytxt, style: TextStyle(color: AppColors.whiteClr,fontSize: 18))
        ),
      ),
    );
  }
}
