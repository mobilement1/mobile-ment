import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/controller/providers/Bottomnavbar_provider.dart';
import 'package:mobile_servies/tech/screens/assigned/assigned_tech.dart';
import 'package:mobile_servies/tech/screens/completed/completed_tech.dart';
import 'package:mobile_servies/tech/screens/home/home.dart';
import 'package:mobile_servies/tech/screens/inProgress/inProgress_tech.dart';
import 'package:provider/provider.dart';

class BottomNavTech extends StatelessWidget {
  const BottomNavTech({super.key});

  static final List<Widget> pages = <Widget>[
     HomePageTech(),
     AssignedPageTech(),
     InprogressTechPagessss(),
     CompletedPageTech(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<TechNavigationProvider>(context);

    return Scaffold(
      body: pages[navigationProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assigned',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_empty),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Completed',
          ),
        ],
        currentIndex: navigationProvider.selectedIndex,
        selectedItemColor: Color.fromARGB(255, 85, 105, 53),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          Provider.of<TechNavigationProvider>(context, listen: false).setIndex(index);
        },
      ),
    );
  }
}