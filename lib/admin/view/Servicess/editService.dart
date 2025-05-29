import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Servicess/widgets.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/widgets/appBar.dart';

class Editservice extends StatelessWidget {
  const Editservice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C3A),
    appBar: customAppBar(),
      body: Center(
        child: Container(
          height: 600,
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
           color: const Color.fromARGB(255, 45, 45, 83),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Services",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),

              const Text("Service Name", style: TextStyle(color: Colors.white,fontSize: 18)),
              const SizedBox(height: 8),
              textFormField("Enter service name"),

              const SizedBox(height: 16),
              const Text("Description", style: TextStyle(color: Colors.white,fontSize: 18)),
              const SizedBox(height: 8),
              textFormField("Enter description"),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Price", style: TextStyle(color: Colors.white,fontSize: 18)),
                        const SizedBox(height: 8),
                        textFormField("Price"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Estimated Time", style: TextStyle(color: Colors.white,fontSize: 18)),
                        const SizedBox(height: 8),
                        textFormField("Time"),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text("Category", style: TextStyle(color: Colors.white,fontSize: 18)),
              const SizedBox(height: 8),
              textFormField("Enter category"),

              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  const Text("Mark as Popular", style: TextStyle(color: Colors.white)),
                ],
              ),

              const Spacer(),

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
                      backgroundColor: AppColors.darkBluePurple,
                    ),
                    onPressed: () {},
                    child: const Text("Save", style: TextStyle(color: Colors.white,fontSize: 18)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}