import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/utils/utils.dart';
import 'package:mobile_servies/user/view/UserLogin/user_login.dart';
import 'package:mobile_servies/user/viewmodel/user_auth_provider.dart';

Widget text(String text, Color color, double size, FontWeight fontWeight) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
    ),
  );
}

Widget icon(IconData icon, Color color) {
  return Icon(icon, color: color);
}

Widget TechTextField(String hintText, {int maxLines = 1}) {
  return TextFormField(
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.openSans(
        color: const Color(0xFF8D8D8D),
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF8D8D8D), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF718355), width: 2),
      ),
    ),
    style: GoogleFonts.openSans(
      color: const Color(0xFF2E2E2E),
    ),
  );
}

void showLogoutDialog(BuildContext context, UserAuthProvider authProvider) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Logout",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      content: Text(
        "Are you sure you want to logout?",
        style: GoogleFonts.openSans(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: GoogleFonts.poppins(color: ColorStyle.textSecondary),
          ),
        ),
        TextButton(
          onPressed: () {
            authProvider.logoutUser();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => UserLogin(),
              ),
              (route) => false,
            );
          },
          child: Text(
            "Logout",
            style: GoogleFonts.poppins(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}

Widget ActionCard(
  String title,
  String subtitle,
  IconData icon,
  Gradient? gradient,
  VoidCallback onTap,
  bool isOutlined,
) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: isOutlined ? null : gradient,
        color: isOutlined ? Colors.white : null,
        borderRadius: BorderRadius.circular(20),
        border: isOutlined
            ? Border.all(color: const Color(0xFF718355), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF718355).withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isOutlined
                  ? const Color(0xFF718355).withOpacity(0.1)
                  : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isOutlined ? const Color(0xFF718355) : Colors.white,
              size: 24,
              semanticLabel: title,
            ),
          ),
          const Gap(16),
          text(
            title,
            isOutlined ? ColorStyle.textPrimary : Colors.white,
            18,
            FontWeight.w600,
          ),
          const Gap(4),
          text(
            subtitle,
            isOutlined
                ? ColorStyle.textSecondary
                : Colors.white.withOpacity(0.8),
            14,
            FontWeight.w400,
          ),
        ],
      ),
    ),
  );
}

Widget FeaturesSection() {
  final List<Map<String, dynamic>> features = [
    {
      'icon': Icons.verified_user,
      'text': TextConstants.warranty,
    },
    {
      'icon': Icons.access_time,
      'text': TextConstants.repair,
    },
    {
      'icon': Icons.location_on,
      'text': TextConstants.onsite,
    },
  ];

  return Container(
    padding: const EdgeInsets.all(20),
    decoration: ColorStyle.neumorphicCardDecoration,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: features
          .map((feature) => FeatureItem(
                icon: feature['icon'] as IconData,
                text: feature['text'] as String,
              ))
          .toList(),
    ),
  );
}

Widget FeatureItem({required IconData icon, required String text}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF718355).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF718355),
          size: 24,
          semanticLabel: text,
        ),
      ),
      const Gap(8),
      Text(
        text,
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF2E2E2E),
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
