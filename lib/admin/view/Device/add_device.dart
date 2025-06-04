import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Device/widgets.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/appBar.dart';

class AddDeviceScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 85, 105, 53),iconTheme: IconThemeData(color: Colors.white),),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF718355),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.grey),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Add Device',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: AppColors.whiteClr,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: AdminbuildTextField(label: "Brand")),
                    const SizedBox(width: 10),
                    Expanded(child: AdminbuildTextField(label: "Type")),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: AdminbuildTextField(label: "Name")),
                    const SizedBox(width: 10),
                    Expanded(child: AdminbuildTextField(label: "Model")),
                  ],
                ),
                const SizedBox(height: 10),
                AdminbuildTextField(label: "Year Released"),
                const SizedBox(height: 10),
                AdminbuildTextField(label: "Repairable Components (comma separated)", maxLines: 2),
                const SizedBox(height: 10),
                AdminbuildTextField(label: "Common Issues (comma separated)", maxLines: 2),
                const SizedBox(height: 20),
 Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel", style: TextStyle(color: Colors.white,fontSize: 18)),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 85, 105, 53),
                    ),
                    onPressed: () {},
                    child: const Text("Add", style: TextStyle(color: Colors.white ,fontSize: 18)),
                  ),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
