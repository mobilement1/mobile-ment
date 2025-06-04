import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController addressNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  String selectedLocation = "Select Location From Map";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF718355),
      body: Column(
        children: [
          const Gap(80), // Space at the top with green background
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "Select Address",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2E2E2E),
                              letterSpacing: 0.5,
                              shadows: [
                                Shadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(2, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: icon(Icons.arrow_back, const Color(0xFF5A5A5A)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const Gap(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "Choose your preferred service address or add a new one.",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF5A5A5A),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomTextField(
                        controller: addressNameController,
                        labelText: "Address Name",
                        prefixIcon: Icons.home_outlined,
                      ),
                    ),
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomTextField(
                        controller: streetController,
                        labelText: "Street Address",
                        prefixIcon: Icons.location_on_outlined,
                      ),
                    ),
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: cityController,
                              labelText: "City",
                              prefixIcon: Icons.location_city,
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: CustomTextField(
                              controller: stateController,
                              labelText: "State",
                              prefixIcon: Icons.map_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomTextField(
                        controller: zipCodeController,
                        labelText: "Zip Code",
                        prefixIcon: Icons.local_post_office_outlined,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            selectedLocation = "Pazhamalloor, Perinthalmanna, Kerala, 676506, India";
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Location From Map",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2E2E2E),
                              ),
                            ),
                            const Gap(10),
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(color: const Color(0xFF8D8D8D)),
                                borderRadius: BorderRadius.circular(8),
                                image: const DecorationImage(
                                  image: AssetImage("asset/location.jpeg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customButton(
                            label: "Cancel",
                            icon: null,
                            hasBorder: true,
                            onPressed: () => Navigator.pop(context),
                          ),
                          customButton(
                            label: "Save Address",
                            icon: Icons.save,
                            onPressed: () {
                              String fullAddress =
                                  "${addressNameController.text}, ${streetController.text}, ${cityController.text}, ${stateController.text}, ${zipCodeController.text}\nLocation: $selectedLocation";
                              Navigator.pop(context, fullAddress);
                            },
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.openSans(color: const Color(0xFF2E2E2E)),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.openSans(color: const Color(0xFF8D8D8D)),
        prefixIcon: Icon(prefixIcon, color: const Color(0xFF5A5A5A)),
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
    );
  }
}
