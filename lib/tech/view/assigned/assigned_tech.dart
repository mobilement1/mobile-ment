import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';
import 'package:mobile_servies/tech/controller/providers/assigned_provider.dart';
import 'package:mobile_servies/tech/model/assigned_model.dart';
import 'package:mobile_servies/tech/widgets/container.dart';
import 'package:mobile_servies/tech/widgets/shimmer.dart';
import 'package:mobile_servies/tech/widgets/textField.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AssignedPageTech extends StatefulWidget {
  const AssignedPageTech({super.key});

  @override
  State<AssignedPageTech> createState() => _AssignedPageTechState();
}

class _AssignedPageTechState extends State<AssignedPageTech> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AssignedTechProvider>(context, listen: false).initialize();
    });
  }

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
                TextConsts.assignedTasks,
                style: TextStyle(
                  color: AppColors.whiteClr,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 10),
            searchField(
              onChanged: (value) {
                Provider.of<AssignedTechProvider>(context, listen: false)
                    .fetchTasksWithSearch(value);
              },
            ),
            const SizedBox(height: 8),
            _buildStatusCounters(),
            const SizedBox(height: 8),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCounters() {
    return Consumer<AssignedTechProvider>(
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
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Consumer<AssignedTechProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading && provider.assignedTasks.isEmpty) {
              return buildShimmerList();
            }
            if (provider.assignedTasks.isEmpty) {
              return Center(
                child: Text(
                  provider.errorMessage ?? 'No assigned tasks',
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: provider.assignedTasks.length,
              itemBuilder: (context, index) {
                final task = provider.assignedTasks[index];
                final isExpanded = provider.selectedIndex == index;

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => provider.dropContainer(index),
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF718355).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(36, 255, 255, 255),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.phone_android_outlined,
                              size: 30,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          title: Text(
                            task.customerName,
                            style: const TextStyle(
                              color: AppColors.whiteClr,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            task.deviceDetails,
                            style: const TextStyle(color: Colors.white70),
                          ),
                          trailing: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    if (isExpanded) _buildExpandedTaskDetails(provider, task),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildExpandedTaskDetails(
    AssignedTechProvider provider,
    AssignedModel task,
  ) {
    return Padding(
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
                  onPressed: provider.isAccepting[task.bookingId] ?? false
                      ? null // Disable button while loading
                      : () async {
                          final success =
                              await provider.acceptTask(task.bookingId);
                          _showSnackBar(
                            context,
                            success ? "Task Accepted ✅" : "Failed to accept task",
                          );
                        },
                  icon: provider.isAccepting[task.bookingId] ?? false
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.check),
                  label: const Text("Accept"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton.icon(
                  onPressed: provider.isRejecting[task.bookingId] ?? false
                      ? null // Disable button while loading
                      : () {
                          _showRejectConfirmationDialog(provider, task);
                        },
                  icon: provider.isRejecting[task.bookingId] ?? false
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.close),
                  label: const Text("Reject"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showRejectConfirmationDialog(
      AssignedTechProvider provider, AssignedModel task) {
    final TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: text("Confirm Rejection", const Color.fromARGB(179, 67, 67, 67), 23, FontWeight.w500),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              text("Are you sure you want to reject this task?", const Color.fromARGB(253, 96, 95, 95), 18, FontWeight.w400),
              const SizedBox(height: 10),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: "Reason for rejection (optional)",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                final reason = reasonController.text.isEmpty
                    ? 'Task rejected by technician'
                    : reasonController.text;
                Navigator.of(context).pop();
                final success = await provider.rejectTask(task.bookingId, reason);
                _showSnackBar(
                  context,
                  success ? "Task Rejected ❌" : (provider.errorMessage ?? "Failed to reject task"),
                );
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
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