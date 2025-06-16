import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_servies/tech/constants/colors.dart';
import 'package:flutter/gestures.dart';

class AboutUsTech extends StatelessWidget {
  const AboutUsTech({super.key});

  void _launchWebsite() async {
    final Uri url = Uri.parse('https://mobile-mend-ui.vercel.app/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(backgroundColor:  Color.fromARGB(255, 85, 105, 53),iconTheme: IconThemeData(color:  Color.fromARGB(255, 255, 255, 254)),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''
Welcome to MobileMend!

MobileMend is your trusted solution for reliable and affordable mobile repair services. Our mission is to connect skilled technicians with customers who need quick and professional service right at their doorstep.

What We Do:
• Provide on-demand mobile device repairs.
• Offer technician tracking, updates, and secure communication.
• Ensure transparency, trust, and quality service every time.

Our technicians are trained, verified, and equipped with the tools needed to fix smartphones efficiently and safely. Whether it's a screen replacement, battery issue, or software problem – we've got it covered.

Why Choose MobileMend?
• Fast and reliable service
• Transparent pricing
• Verified and skilled technicians
• Convenient scheduling

We’re committed to simplifying mobile repair with just a few taps. Thank you for choosing us!
                ''',
                style: TextStyle(color: AppColors.whiteClr, height: 1.5,fontSize: 18),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _launchWebsite,
                child: Text(
                  '🌐 Visit our website:\nhttps://mobile-mend-ui.vercel.app/',
                  style: TextStyle(
                    color: Colors.blue,fontSize: 17,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '📧 Contact: support@mobilemend.com',
                style: TextStyle(color: AppColors.whiteClr,fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                "Together, let's keep your devices running like new!",
                style: TextStyle(color: AppColors.whiteClr,fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
