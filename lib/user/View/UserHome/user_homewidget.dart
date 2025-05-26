import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget text(String text,Color color,double size,FontWeight fontWeight){
  return Text(text,style: TextStyle(color: color,
  fontSize: size,
  fontWeight: fontWeight),);
}
Widget icon(IconData icon,Color color){
  return Icon(icon,color:color);
}


Widget customButton({
  required String label,
  required VoidCallback onPressed,
  IconData? icon,
  bool hasBorder = false,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0x3361DAFB),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: hasBorder ? const BorderSide(color: Colors.black) : BorderSide.none,
      ),
    ),
    onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        icon != null
            ? Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(icon, color: Colors.white),
                ],
              )
            : Container(), 
      ],
    ),
  );
}



