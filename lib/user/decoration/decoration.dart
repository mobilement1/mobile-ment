import 'package:flutter/material.dart';


Container containerStyle(double height,double width,
Color color,Widget child,{Color?borderColor,double borderWidth=1.0}){
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
       border: borderColor != null
          ? Border.all(
              color: borderColor,
              width: borderWidth,
            )
          : null,
    ),
   child: child,
  );
}
Widget containers(Widget child){
  return Expanded(
  child:   Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
    child: child));
}