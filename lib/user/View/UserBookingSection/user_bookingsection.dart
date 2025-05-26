import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/utils/utils.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/view/userbookingsection/user_bookingsection_widget.dart';


class BookRepairPage extends StatefulWidget {
  const BookRepairPage({super.key});

  @override
  State<BookRepairPage> createState() => _BookRepairPageState();
}

class _BookRepairPageState extends State<BookRepairPage> {
  String? selectedDevice;
  String? selectedService;
  String issueDescription = '';

  final devices = ['iPhone', 'Samsung', 'OnePlus', 'Google Pixel'];
  final services = ['Screen Repair', 'Battery Replacement', 'Camera Cleaning'];

  bool addressAvailable = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: Colors.white,
  ),
        title:text(TextConstants.book1, Colors.white, 20, FontWeight.bold)
     
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
                 
          height: 650,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [ Color(0xFF181850), Color(0xFF2C3E50)],begin: Alignment.bottomCenter, )),
         
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          
                    Gap(20),
                   Center(child: text(TextConstants.convenience, Colors.white, 20, FontWeight.bold)),
                    const SizedBox(height: 20),
                   
                     
                     text(TextConstants.selectDevice, Colors.white, 18, FontWeight.bold)   ,         
                    buildDropdown(
                  value: selectedDevice,
                  items: devices,
                  hintText: TextConstants.selectDevice,
                  onChanged: (value) {
                    setState(() {
                      selectedDevice = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                 text(TextConstants.selectService, Colors.white, 18, FontWeight.bold)   , 
                buildDropdown(
                  value: selectedService,
                  items: services,
                  hintText: TextConstants.selectService,
                  onChanged: (value) {
                    setState(() {
                      selectedService = value;
                    });
                  },
                ),
                
                    const SizedBox(height: 16),
                          
                    // Select Address
                    text(TextConstants.selectAddress, const Color.fromARGB(255, 230, 228, 228), 18, FontWeight.bold),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        addressAvailable ? TextConstants.availableAddress : TextConstants.notAvailableAddress,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: addressAvailable ? Colors.black : Colors.red,
                        ),
                      ),
                    ),
                          
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                       
                        },
                        child: text(TextConstants.selectOther, Colors.black, 15, FontWeight.bold)
                      ),
                    ),
                          
                    const SizedBox(height: 16),
                          
                 
                    text(TextConstants.describe, const Color.fromARGB(255, 217, 217, 217), 18, FontWeight.bold),
                    TextFormField(
                  maxLines: 3,
                   style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorStyle.containerColor,
                    hintText: TextConstants.describe,
                    hintStyle:  TextStyle(color: Colors.white70), 
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    issueDescription = value;
                  },
                ),
                
                          
                    Gap(30),
                          
                    
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:(){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue
                        ),
                        child: text(TextConstants.proceed, Colors.white, 18, FontWeight.bold)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
