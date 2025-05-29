import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      appBar: AppBar(title:  text("Select Address",Colors.white,20,FontWeight.bold)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Choose your preferred service address or add a new one.",
             Colors.white,18,FontWeight.normal
            ),
            const SizedBox(height: 20),

            // Address Name
            CustomTextField(
  controller: addressNameController,
  labelText: "Address Name",
  prefixIcon: Icons.home_outlined,
),
const SizedBox(height: 16),

CustomTextField(
  controller: streetController,
  labelText: "Street Address",
  prefixIcon: Icons.location_on_outlined,
),
const SizedBox(height: 16),

Row(
  children: [
    Expanded(
      child: CustomTextField(
        controller: cityController,
        labelText: "City",
        prefixIcon: Icons.location_city,
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: CustomTextField(
        controller: stateController,
        labelText: "State",
        prefixIcon: Icons.map_outlined,
      ),
    ),
  ],
),
const SizedBox(height: 16),

CustomTextField(
  controller: zipCodeController,
  labelText: "Zip Code",
  prefixIcon: Icons.local_post_office_outlined,
  keyboardType: TextInputType.number,
),

            const SizedBox(height: 20),

            // Select Location from Map
            GestureDetector(
              onTap: () async {
                // Here open map picker screen or dummy location
                // For now hardcoded sample location
                setState(() {
                  selectedLocation = "Pazhamalloor, Perinthalmanna, Kerala, 676506, India";
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   text("Select Location From Map",Colors.white,20,
                      FontWeight.bold),
                  const SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: AssetImage(
                            "asset/location.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    
                    
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child:  text("Cancel",Colors.white,15,FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    String fullAddress =
                        "${addressNameController.text}, ${streetController.text}, ${cityController.text}, ${stateController.text}, ${zipCodeController.text}\nLocation: $selectedLocation";
                    Navigator.pop(context, fullAddress);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF181850)
                  ),
                  child: const Text("Save Address", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
