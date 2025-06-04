import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';

class PrivacypolicyTech extends StatelessWidget {
  const PrivacypolicyTech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(backgroundColor:  Color.fromARGB(255, 85, 105, 53),iconTheme: IconThemeData(color:  Color.fromARGB(255, 255, 255, 254)),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text( TextConsts.privacytxt, style: TextStyle(color: AppColors.whiteClr,fontSize: 18))
        ),
      ),
    );
  }
}
