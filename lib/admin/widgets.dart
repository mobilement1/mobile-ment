import 'package:flutter/material.dart';
import 'package:mobile_servies/admin/view/Booking/bookingpage.dart';
import 'package:mobile_servies/admin/view/Dashbord/dashbord.dart';
import 'package:mobile_servies/admin/view/Device/devicepage.dart';
import 'package:mobile_servies/admin/view/Servicess/service.dart';
import 'package:mobile_servies/admin/view/Technicianrequst/techniciarequst.dart';
import 'package:mobile_servies/admin/view/Technicians/techician.dart';
import 'package:mobile_servies/admin/view/completedoders/cmpltedorder.dart';
import 'package:mobile_servies/user/View/UserLogin/user_login.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:provider/provider.dart';

class AdminDraw extends StatelessWidget {
  const AdminDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1E1E2E),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        children: [
          const Text(
            "Admin Dashboard",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildTile(context, Icons.dashboard, "Dashboard",  Dashbordpage()),
          _buildTile(context, Icons.book_online, "Booking", const Bookingpage()),
          _buildTile(context, Icons.build, "Services",  Servicepage()),
          _buildTile(context, Icons.devices, "Devices",  Devicepage()),
          _buildTile(context, Icons.engineering, "Technicians",  Techicianpage()),
          _buildTile(context, Icons.check_circle, "Completed Orders",  Cmpltedorderpage()),
          _buildTile(context, Icons.engineering, "Technician Requests", const Techniciarequstpage()),
          Consumer<UserAuthProvider>(
            builder: (context, authpro, child) {
              return ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text("Logout", style: TextStyle(color: Colors.white)),
                onTap: () {
                  _showLogoutDialog(context, authpro);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, IconData icon, String title, Widget page) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }

  void _showLogoutDialog(BuildContext context, UserAuthProvider authpro) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Confirm Logout",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white70),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
        content: const Text(
          "Are you sure you want to logout?",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkBluePurple, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      authpro.logoutUser();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (ctx) =>  UserLogin()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}