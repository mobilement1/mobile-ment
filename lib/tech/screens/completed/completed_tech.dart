import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/controller/completed_provider.dart';

import 'package:mobile_servies/tech/screens/completed/widgets/widgets.dart';

import 'package:mobile_servies/tech/widgets/container.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:provider/provider.dart';

class CompletedPageTech extends StatefulWidget {
  const CompletedPageTech({super.key});

  @override
  State<CompletedPageTech> createState() => _CompletedPageTechState();
}

class _CompletedPageTechState extends State<CompletedPageTech> {
  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_){
Provider.of<CompletedTechProvider>(context, listen: false).initialize();
   });
      
    
  }

  final TextEditingController completedCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: Text(
                TextConsts.completed,
                style: TextStyle(
                  color: AppColors.whiteClr,
                  fontSize: 28,


                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: searchField(
                context: context,
                onChanged: (value) {
                  Provider.of<CompletedTechProvider>(context, listen: false).searchFn(value);
                },
                controller: completedCtrl,
              ),
            ),
            const SizedBox(height: 10),
            _buildStatusCounters(),
            const SizedBox(height: 8),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCounters() {
    return Consumer<CompletedTechProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              colorContainers(
                Icons.assignment,
                ' ${provider.taskCounts['Assigned'] ?? 0}',
                'Assigned',
              ),
              colorContainers(
                Icons.hourglass_empty,
                ' ${provider.taskCounts['InProgress'] ?? 0}',
                'In Progress',
              ),
              colorContainers(
                Icons.check_circle,
                ' ${provider.taskCounts['Completed'] ?? 0}',
                'Completed',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF718355)),
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Consumer<CompletedTechProvider>(
          builder: (context, provider, _) {
            if (provider.isFirstLoad) {
              return buildShimmerList();
            }
            if (provider.completedTasks.isEmpty) {
              return Center(
                child: Text(
                  provider.errorMessage ?? 'No completed tasks',
                ),
              );
            }else if(provider.searchedList.isEmpty){
               return Center(
                child: Text(
                  provider.errorMessage ?? 'No searched tasks found',
                ),
              );
            }
            return RefreshIndicator(onRefresh: () => provider.initialize(),
              child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: provider.searchedList.length,
                itemBuilder: (context, index) {
                  final task = provider.searchedList[index];
                  final isExpanded = provider.selectedIndex == index;
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => provider.dropContainer(index),
                        child: Card(
                          margin: const EdgeInsets.all(5.0),
                          elevation: 2,
                          color: Color(0xFFE9F5DB),
                          
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(35, 182, 182, 182),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.phone_android_outlined,
                                size: 30,
                                color: Colors.green
                                    
                              ),
                            ),
                            title: Text(
                              task.customerName,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 103, 102, 102),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              task.deviceDetails,
                              style: const TextStyle(color: Color.fromARGB(255, 103, 102, 102)),
                            ),
                            trailing: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.black,
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
                              color: const Color(0xFF718355).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  "Complaint: ${task.issue}",
                                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Location: ${task.location}",
                                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Status: ${task.status}",
                                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        viewDialog(context, task);
                                      },
                                      icon: const Icon(Icons.remove_red_eye_sharp),
                                      label: const Text("View"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF718355),
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}