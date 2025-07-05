import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/controller/providers/inProgress_provider.dart';
import 'package:mobile_servies/tech/widgets/container.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:provider/provider.dart';

class InprogressTechPagessss extends StatefulWidget {
  const InprogressTechPagessss({super.key});

  @override
  State<InprogressTechPagessss> createState() => _InprogressTechPagessssState();
}

class _InprogressTechPagessssState extends State<InprogressTechPagessss> {
  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_){
Provider.of<InProgressTechProvider>(context, listen: false).initialize();
   });
      
   
  }

  final TextEditingController inProgressCtrl = TextEditingController();

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
                TextConsts.inProgress,
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
                  Provider.of<InProgressTechProvider>(context, listen: false).searchFn(value);
                },
                controller: inProgressCtrl,
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
    return Consumer<InProgressTechProvider>(
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
        child: Consumer<InProgressTechProvider>(
          builder: (context, provider, _) {
            if (provider.isFirstLoad) {
              return buildShimmerList();
            }
            if (provider.inProgressTasks.isEmpty) {
              return Center(
                child: Text(
                  provider.errorMessage ?? 'No in-progress tasks',
                ),
              );
            }else if(provider.searchedList.isEmpty){
               return Center(
                child: Text(
                  provider.errorMessage ?? 'No Searched tasks found',
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
                              style: const TextStyle(color: Color.fromARGB(255, 103, 102, 102),),
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
                                Text(
                                  "Complaint: ${task.issue}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Location: ${task.location}",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Status: ${task.status}",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: provider.isCompleting[task.bookingId] ?? false
                                          ? null
                                          : () async {
                                              final success = await provider.completeTask(task.bookingId);
                                              _showSnackBar(
                                                context,
                                                success ? "Task Completed ✅" : (provider.errorMessage ?? "Failed to complete task"),
                                              );
                                            },
                                      icon: provider.isCompleting[task.bookingId] ?? false
                                          ? const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : const Icon(Icons.check),
                                      label: const Text("Complete"),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    // ElevatedButton.icon(
                                    //   onPressed: provider.isReassigning[task.bookingId] ?? false
                                    //       ? null
                                    //       : () async {
                                    //           final success = await provider.reassignTask(task.bookingId);
                                    //           _showSnackBar(
                                    //             context,
                                    //             success ? "Task Reassigned 🔄" : (provider.errorMessage ?? "Failed to reassign task"),
                                    //           );
                                    //         },
                                    //   icon: provider.isReassigning[task.bookingId] ?? false
                                    //       ? const SizedBox(
                                    //           width: 20,
                                    //           height: 20,
                                    //           child: CircularProgressIndicator(
                                    //             color: Colors.white,
                                    //             strokeWidth: 2,
                                    //           ),
                                    //         )
                                    //       : const Icon(Icons.refresh),
                                    //   label: const Text("Reassign"),
                                    //   style: ElevatedButton.styleFrom(
                                    //     backgroundColor: Colors.orange,
                                    //     foregroundColor: Colors.white,
                                    //   ),
                                    // ),
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

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}