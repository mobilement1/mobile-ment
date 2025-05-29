import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserBooking/userbookingWidget.dart';
import 'package:mobile_servies/user/View/UserBookingSection/addAddress.dart';

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

  final devices = ['iPhone 13', 'S23 Ultra', 'iPhone 15', 'F9'];
  final services = ['Speaker Replacement', 'Storage Increase', 'Screen Guard Service','Camera Cleaning','Charging port Repair','Water Damage','Screen Replacement','Board Change'];
  List<String> savedAddresses = [];
  bool addressAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: text(TextConstants.book1, Colors.white, 20, FontWeight.bold)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 650,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [Color(0xFF181850), Color(0xFF2C3E50)],
                begin: Alignment.bottomCenter,
              )),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Center(
                        child: text(TextConstants.convenience, Colors.white, 20,
                            FontWeight.bold)),
                    const SizedBox(height: 20),

                    text(TextConstants.selectDevice, Colors.white, 18,
                        FontWeight.bold),
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
                    text(TextConstants.selectService, Colors.white, 18,
                        FontWeight.bold),
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
                    text(
                        TextConstants.selectAddress,
                        const Color.fromARGB(255, 230, 228, 228),
                        18,
                        FontWeight.bold),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        addressAvailable
                            ? TextConstants.availableAddress
                            : TextConstants.notAvailableAddress,
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
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      const Color.fromARGB(255, 203, 201, 201),
                                  title: text("Select or Add Address",
                                      Colors.black, 18, FontWeight.bold),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      savedAddresses.isNotEmpty
                                          ? Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: savedAddresses
                                                  .map((address) => Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                bottom: 8.0),
                                                        child: text(
                                                            address,
                                                            Colors.white,
                                                            14,
                                                            FontWeight.normal),
                                                      ))
                                                  .toList(),
                                            )
                                          : text(
                                              "No saved addresses",
                                              Colors.redAccent,
                                              14,
                                              FontWeight.normal),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: text("Cancel", Colors.red, 16,
                                          FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF181850)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddAddressPage()));
                                      },
                                      child: text('Add Address', Colors.white,
                                          15, FontWeight.bold),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: text(TextConstants.selectAddress, Colors.black,
                              15, FontWeight.bold)),
                    ),

                    const SizedBox(height: 16),

                    text(
                        TextConstants.describe,
                        const Color.fromARGB(255, 217, 217, 217),
                        18,
                        FontWeight.bold),
                    TextFormField(
                      maxLines: 3,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorStyle.containerColor,
                        hintText: TextConstants.describe,
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade400, width: 1.5),
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.all(8),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 203, 201, 201),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        text('Select Technician (Auto/Manual)',
                                            Colors.black, 25, FontWeight.bold),
                                        const SizedBox(height: 16),
                                        Card(
                                          color: const Color(0x3361DAFB),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                Icon(Icons.person,
                                                    size: 30,
                                                    color: Colors.white),
                                                text(
                                                    'Select technician automatically',
                                                    Colors.white,
                                                    20,
                                                    FontWeight.normal),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        text('Best Nearest Technicians',
                                            Colors.black, 20, FontWeight.bold),
                                        Card(
                                          color: const Color(0x3361DAFB),
                                          child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  text('yasar s', Colors.white,
                                                      25, FontWeight.bold),
                                                  Row(
                                                    children: [
                                                      icon(
                                                          Icons
                                                              .home_repair_service,
                                                          Colors.white),
                                                      Gap(10),
                                                      text(
                                                          'Experience : 4',
                                                          Colors.white,
                                                          18,
                                                          FontWeight.normal)
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      icon(Icons.build,
                                                          Colors.white),
                                                      Gap(10),
                                                      Expanded(
                                                          child: text(
                                                              'Specialization: Smartphone,Camera,Tv',
                                                              Colors.white,
                                                              18,
                                                              FontWeight
                                                                  .normal))
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      icon(Icons.task,
                                                          Colors.white),
                                                      Gap(10),
                                                      text(
                                                          'Jobs Completed: 1',
                                                          Colors.white,
                                                          18,
                                                          FontWeight.normal)
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                        Gap(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.grey),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: text(
                                                    'Cancel',
                                                    Colors.white,
                                                    20,
                                                    FontWeight.bold)),
                                            Gap(20),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue),
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext) {
                                                        return Dialog(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          insetPadding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  203,
                                                                  201,
                                                                  201),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      16.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  text(
                                                                      'Booking Estimate',
                                                                      Colors
                                                                          .black,
                                                                      25,
                                                                      FontWeight
                                                                          .bold),
                                                                  Gap(20),
                                                                  text(
                                                                      'Booking Charge: ₹199',
                                                                      Colors
                                                                          .black,
                                                                      18,
                                                                      FontWeight
                                                                          .normal),
                                                                  text(
                                                                      'Service Charge: ₹2499',
                                                                      Colors
                                                                          .black,
                                                                      18,
                                                                      FontWeight
                                                                          .normal),
                                                                  text(
                                                                      'Travel Allowance: ₹144.4',
                                                                      Colors
                                                                          .black,
                                                                      18,
                                                                      FontWeight
                                                                          .normal),
                                                                  text(
                                                                      'Total Distance: 7.2 km',
                                                                      Colors
                                                                          .black,
                                                                      18,
                                                                      FontWeight
                                                                          .normal),
                                                                  text(
                                                                      'Total Cost: ₹2842.4Total Distance: 7.2 km',
                                                                      Colors
                                                                          .black,
                                                                      18,
                                                                      FontWeight
                                                                          .bold),
                                                                  Gap(20),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors
                                                                                  .grey),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child: text(
                                                                              'Cancel',
                                                                              Colors.white,
                                                                              20,
                                                                              FontWeight.bold)),
                                                                      ElevatedButton(
                                                                          style: ElevatedButton.styleFrom(
                                                                              backgroundColor: Colors
                                                                                  .blue),
                                                                          onPressed:
                                                                              () {},
                                                                          child: text(
                                                                              'pay Now',
                                                                              Colors.white,
                                                                              20,
                                                                              FontWeight.bold)),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: text(
                                                    'Proceed',
                                                    Colors.white,
                                                    20,
                                                    FontWeight.bold)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: text(TextConstants.proceed, Colors.white, 18,
                              FontWeight.bold)),
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
