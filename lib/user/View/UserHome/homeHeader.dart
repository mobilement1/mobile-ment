import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/utils/utils.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/view/userhome/become_tech.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';
import 'package:provider/provider.dart';

Widget HeaderSection(Animation<double> fadeAnimation) {
  return FadeTransition(
    opacity: fadeAnimation,
    child: Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLogo(),
              ProfileMenu(),
            ],
          ),
          Gap(16),
          HeaderText(),
        ],
      ),
    ),
  );
}

Widget AppLogo() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white.withOpacity(0.2)),
    ),
    child: Text(
      TextConstants.mobilemend,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        letterSpacing: 1.2,
      ),
      semanticsLabel: "MobileMend logo",
    ),
  );
}

Widget HeaderText() {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [Colors.white, Color(0xFFE8F5E8)],
    ).createShader(bounds),
    child: Text(
      "Premium Device\nCare Service",
      style: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Colors.white,
        height: 1.2,
      ),
      semanticsLabel: "Premium Device Care Service",
    ),
  );
}

Widget ProfileMenu() {
  return Consumer<UserAuthProvider>(
    builder: (context, authProvider, child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: PopupMenuButton<String>(
          icon: const Icon(
            Icons.person_outline,
            color: Colors.white,
            size: 24,
            semanticLabel: "User profile menu",
          ),
          color: Colors.white.withOpacity(0.95),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onSelected: (value) {
            if (value == 'logout') {
              showLogoutDialog(context, authProvider);
            }
          },
          itemBuilder: (context) => [
            buildMenuItem(
              value: 'technician',
              icon: Icons.build,
              label: "Become Technician",
              iconColor: const Color(0xFF718355),
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      BecomeTechPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  },
                ),
              ),
            ),
            buildMenuItem(
              value: 'logout',
              icon: Icons.logout,
              label: "Logout",
              iconColor: Colors.red,
            ),
          ],
        ),
      );
    },
  );
}

PopupMenuItem<String> buildMenuItem({
  required String value,
  required IconData icon,
  required String label,
  required Color iconColor,
  VoidCallback? onTap,
}) {
  return PopupMenuItem<String>(
    value: value,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const Gap(12),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: ColorStyle.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
