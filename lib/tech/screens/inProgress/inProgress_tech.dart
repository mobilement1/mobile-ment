import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/widgets/container.dart';
import 'package:mobile_servies/tech/widgets/appBar.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:provider/provider.dart';

class InprogressTechPagessss extends StatelessWidget {
  const InprogressTechPagessss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBluePurple,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(TextConsts.inProgress,
                style: TextStyle(color: AppColors.whiteClr,fontSize: 28,fontWeight: FontWeight.w700,
                ),),
            ),
            const SizedBox(height: 10),
            searchField(),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  colorContainers(Icons.assignment, ' 12', 'Assigned'),
                  colorContainers(Icons.hourglass_empty, ' 7', 'In Progress'),
                  colorContainers(Icons.check_circle, ' 20', 'Completed'),
                ],),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  color: const Color.fromARGB(255, 44, 44, 78),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<AssignedTechProvider>(
                    builder: (context, provider, _) {
                      return ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          final isExpanded = provider.selectedIndex == index;
                          return Column(children: [
                              GestureDetector(
                                onTap: () => provider.dropContainer(index),
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1),borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColors.grey),),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
                                    leading: Container( height: 50, width: 50, decoration: BoxDecoration(
                                        color: const Color(0x3061DAFB),borderRadius: BorderRadius.circular(15),),
                                      child: const Icon( Icons.phone_android_outlined, size: 30, color: Colors.cyan),
                                    ),
                                    title: Text(  "Smith",style: const TextStyle(color: AppColors.whiteClr,fontWeight: FontWeight.bold), ),
                                    subtitle: const Text("iPhone 13 - 05/08/2025",style: TextStyle(color: Colors.white70), ),
                                    trailing: Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              if (isExpanded)
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColors.grey),
                                    ),
                                    child: Column( crossAxisAlignment:CrossAxisAlignment.start,
                                      children: [
                                        const Text("Complaint: Screen not working properly",style:TextStyle(color: Colors.white)),
                                        const SizedBox(height: 5),
                                        const Text("Location: Calicut,kerala",style:TextStyle(color: Colors.white70)),
                                        const SizedBox(height: 5),
                                        const Text("Status: Assigned",style:TextStyle(color: Colors.white70)),
                                        const SizedBox(height: 10),
                                        Row(mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text("Task Completed ✅"),duration: Duration(seconds: 1),),
                                                );
                                              },
                                              icon: const Icon(Icons.check),
                                              label: const Text("Complete"),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),SizedBox(width: 5,),
                                            ElevatedButton.icon(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text("Task Reassigned ❌"),duration: Duration(seconds: 1),),
                                                );
                                              },
                                              icon: const Icon(Icons.undo),
                                              label: const Text("Reassign"),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                              ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
