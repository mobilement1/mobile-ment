// import 'package:flutter/material.dart';
// import 'package:mobile_servies/user/utils/utils.dart';



// Widget buildDropdown({
//   required String? value,
//   required List<String> items,
//   required String hintText,
//   required ValueChanged<String?> onChanged,
// }) {
//   return DropdownButtonFormField<String>(
//     decoration: InputDecoration(
//       filled: true,
//       fillColor: ColorStyle.containerColor,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//        hintStyle:  TextStyle(color: Colors.white70),
       
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: const Color.fromARGB(255, 153, 198, 235), width: 2),
//         borderRadius: BorderRadius.circular(8),
//       ),
//     ),
//     hint: Text(hintText, style: const TextStyle(color: Colors.grey, fontSize: 16)),
//     value: value,
//     dropdownColor: const Color.fromARGB(255, 33, 52, 68),
//     iconEnabledColor: Colors.white,             
//     style: const TextStyle(color: Colors.white),
//     items: items.map((item) {
//       return DropdownMenuItem(
//         value: item,
//         child: Text(item),
//       );
//     }).toList(),
//     onChanged: onChanged,
//   );
// }


// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String labelText;
//   final IconData prefixIcon;
//   final TextInputType keyboardType;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.labelText,
//     required this.prefixIcon,
//     this.keyboardType = TextInputType.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
       
//         prefixIconColor: Colors.white70,
//         labelText: labelText,
//         labelStyle: TextStyle(color: Colors.white70),
//         prefixIcon: Icon(prefixIcon),
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }
// }


