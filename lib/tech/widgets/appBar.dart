import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';

AppBar customAppBar([List<Widget>? actionButtons]) {
  return AppBar(
    iconTheme:IconThemeData( color:  AppColors.whiteClr),
    backgroundColor: AppColors.appBarBg,
    title: Row(children: [
        Text(
          TextConsts.mobile,
          style: TextStyle(
            color: AppColors.appBarMobileTitle,
            fontWeight: FontWeight.bold,fontSize: 27
          ),
        ),
        Text(
          TextConsts.mend,
          style: TextStyle(
            color: AppColors.whiteClr,
            fontWeight: FontWeight.bold,fontSize: 27
          ),
        ),
      ],
    ),
    actions: actionButtons,
  );
  
}
