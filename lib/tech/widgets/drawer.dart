import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/controller/providers/Profilestatus_provider.dart';
import 'package:provider/provider.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:mobile_servies/tech/screens/profile/aboutUS.dart';
import 'package:mobile_servies/tech/screens/profile/privacyPolicy.dart';

class AssistiveTouchFab extends StatelessWidget {
  const AssistiveTouchFab({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = const [
    {'icon': Icons.privacy_tip, 'title': 'Privacy Policy'},
    {'icon': Icons.info, 'title': 'About Us'},
    {'icon': Icons.logout, 'title': 'Logout'},
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AssistiveTouchFabProvider>();
    final screenWidth = MediaQuery.of(context).size.width;
    const double fabSize = 56.0;
    const double margin = 20.0;
    final Offset fixedPosition = Offset(screenWidth - fabSize - margin, margin);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (provider.isExpanded)
          GestureDetector(
            onTap: () => provider.close(),
            child: AnimatedOpacity(
              opacity: provider.isExpanded ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                width: screenWidth,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
        Positioned(
          left: fixedPosition.dx,
          top: fixedPosition.dy,
          child: FloatingActionButton(
            backgroundColor: Color(0xFF718355).withOpacity(provider.isExpanded ? 0.7 : 1.0),
            child: Icon(provider.isExpanded ? Icons.close : Icons.menu, color: AppColors.whiteClr),
            onPressed: () => provider.toggleExpanded(),
          ),
        ),
        if (provider.isExpanded)
          Positioned(
            left: fixedPosition.dx - 230 - 15,
            top: fixedPosition.dy,
            child: Container(
              width: 230,
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.grey,
                          child: Icon(Icons.person, size: 40, color: AppColors.whiteClr),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Anderson',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 85, 105, 53),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'john@example.com',
                                style: TextStyle(color: AppColors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Status: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF718355),
                            fontSize: 16,
                          ),
                        ),
                        PopupMenuButton<String>(
                          initialValue: provider.currentStatus,
                          onSelected: (value) => provider.setStatus(value),
                          itemBuilder: (context) => provider.statuses
                              .map(
                                (status) => PopupMenuItem(
                                  value: status,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: provider.statusColors[status],
                                        size: 14,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(status),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF718355)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: provider.statusColors[provider.currentStatus],
                                  size: 14,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  provider.currentStatus,
                                  style: TextStyle(color: Color(0xFF718355), fontSize: 14),
                                ),
                                const SizedBox(width: 6),
                                Icon(Icons.arrow_drop_down, color: Color(0xFF718355)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...menuItems.map((item) => ListTile(
                        leading: Icon(item['icon'], color: Color(0xFF556935)),
                        title: Text(
                          item['title'],
                          style: TextStyle(color: Color(0xFF718355), fontSize: 14),
                        ),
                        onTap: () {
                          provider.close();
                          if (item['title'] == 'Privacy Policy') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PrivacypolicyTech()),
                            );
                          } else if (item['title'] == 'About Us') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AboutUsTech()),
                            );
                          } else if (item['title'] == 'Logout') {
                            // TODO: Add logout logic
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
