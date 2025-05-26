import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/constants/text.dart';

class NotificationPageTech extends StatelessWidget {
  const NotificationPageTech({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.darkBluePurple, AppColors.justSample],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 2,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.notifications_active, color: Colors.white),
              title: Text(
                'Task ${index + 1}',
                style: const TextStyle(color: Colors.white,fontSize: 20),
              ),
              subtitle: const Text(TextConsts.newtaskassignedbyUser,
                style: TextStyle(color: Colors.white70,fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }
}
