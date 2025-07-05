import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/View/UserBottom/user_bottom.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/viewmodel/addressProvider.dart';
import 'package:mobile_servies/user/viewmodel/bookingProvider.dart';
import 'package:mobile_servies/user/viewmodel/estimatedProvider.dart';
import 'package:provider/provider.dart';

Widget showScreen(BuildContext context) {
  final addressProvider = Provider.of<Addressprovider>(context);
  return SizedBox(
    width: double.infinity,
    child: customButton(
        label: addressProvider.isLoading ? "" : TextConstants.proceed,
        icon: addressProvider.isLoading ? null : Icons.arrow_forward,
        isLoading: addressProvider.isLoading,
        onPressed: addressProvider.isLoading
            ? null
            : () async {
                addressProvider.setLoading(true);
                try {
                  final bookingProvider =
                      Provider.of<BookingProviderUser>(context, listen: false);

                  if (bookingProvider.selectedDeviceID == null ||
                      bookingProvider.selectedServiceID == null ||
                      bookingProvider.selectedAddressID == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Please fill all required fields")),
                    );
                    addressProvider.setLoading(false);
                    return;
                  }
                  final technicians =
                      await bookingProvider.fetchNearbyTechnicians();
                  if (technicians.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("No Technicians Available"),
                        content: Text(
                            "No nearby technicians found for your location."),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text("OK")),
                        ],
                      ),
                    );
                    return;
                  }

                  // Auto-select first technician
                  final autoTech = technicians.first;
                  final technicianId = autoTech["technicianID"];
                  if (technicianId == null || technicianId.toString().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Auto-selected technician has no ID.")),
                    );
                    addressProvider.setLoading(false); // ✅ stop loading
                    return;
                  }

                  bookingProvider
                      .setSelectedTechnicianID(technicianId.toString());
                  log("✅ Auto Technician Set: ${bookingProvider.selectedTechnicianID}");
                  bookingProvider.clearMessages();

                  String selectedTechId =
                      technicianId.toString(); // default: auto technician ID

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        insetPadding: const EdgeInsets.all(8),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.8,
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    'Select Technician\n (Auto/Manual)',
                                    const Color(0xFF2E2E2E),
                                    22,
                                    FontWeight.w600,
                                  ),
                                  const Gap(16),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Card(
                                      color: Color(0xFFE9F5DB),
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            icon(Icons.person, Colors.green),
                                            const Gap(5),
                                            text(
                                              autoTech["technicianName"] ??
                                                  'Select technician automatically',
                                              Color.fromARGB(
                                                  255, 111, 111, 111),
                                              16,
                                              FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(16),
                                  text(
                                    'Best Nearest Technicians',
                                    const Color(0xFF2E2E2E),
                                    20,
                                    FontWeight.w600,
                                  ),
                                  Column(
                                      children: technicians.map<Widget>(
                                    (tech) {
                                      return GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          selectedTechId =
                                              tech["technicianID"].toString();
                                          log("👆 Selected Tech ID: $selectedTechId");
                                        },
                                        child: Card(
                                          color: Color(0xFFE9F5DB),
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                text(
                                                  tech["technicianName"] ??
                                                      "Technician",
                                                  const Color(0xFF2E2E2E),
                                                  20,
                                                  FontWeight.w600,
                                                ),
                                                const Gap(10),
                                                Row(
                                                  children: [
                                                    icon(
                                                        Icons
                                                            .home_repair_service,
                                                        Colors.green),
                                                    const Gap(10),
                                                    text(
                                                      'Experience: ${tech['experience'] ?? "N/A"} yrs',
                                                      Color.fromARGB(
                                                          255, 111, 111, 111),
                                                      16,
                                                      FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  children: [
                                                    icon(Icons.build,
                                                        Colors.green),
                                                    const Gap(10),
                                                    Expanded(
                                                      child: text(
                                                        'Specialization: ${tech['specialization'] ?? "N/A"}',
                                                        Color.fromARGB(
                                                            255, 111, 111, 111),
                                                        16,
                                                        FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  children: [
                                                    icon(Icons.task,
                                                        Colors.green),
                                                    const Gap(10),
                                                    text(
                                                      'Jobs Completed: ${tech['completedJobs'] ?? "N/A"}',
                                                      Color.fromARGB(
                                                          255, 111, 111, 111),
                                                      16,
                                                      FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList()),
                                  Gap(20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      customButton(
                                        label: 'Cancel',
                                        icon: null,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      Consumer2<Estimatedprovider,
                                              Addressprovider>(
                                          builder: (context, estimatedprovider,
                                              addressProvider, child) {
                                        return customButton(
                                          label: addressProvider.isLoading
                                              ? ''
                                              : 'Proceed',
                                          icon: addressProvider.isLoading
                                              ? null
                                              : Icons.arrow_forward,
                                          isLoading: addressProvider.isLoading,
                                          onPressed: addressProvider.isLoading
                                              ? null
                                              : () async {
                                                  addressProvider
                                                      .setLoading(true);
                                                  if (selectedTechId.isEmpty) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              "Technician not selected.")),
                                                    );
                                                    addressProvider
                                                        .setLoading(false);
                                                    return;
                                                  }
                                                  bookingProvider
                                                      .setSelectedTechnicianID(
                                                          selectedTechId);

                                                  estimatedprovider.setIDs(
                                                    technicianId: bookingProvider
                                                        .selectedTechnicianID!,
                                                    addressId: bookingProvider
                                                        .selectedAddressID!,
                                                    serviceId: bookingProvider
                                                        .selectedServiceID!,
                                                  );

                                                  await estimatedprovider
                                                      .fetchEstimateAfterBooking();
                                                  addressProvider
                                                      .setLoading(false);

                                                  final estimate =
                                                      estimatedprovider
                                                          .estimateData;

                                                  if (estimate == null) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                          content: Text(
                                                              "Failed to fetch estimate.")),
                                                    );
                                                    return;
                                                  }
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Dialog(
                                                        backgroundColor:
                                                            Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        insetPadding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
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
                                                                const Color(
                                                                    0xFF2E2E2E),
                                                                22,
                                                                FontWeight.w600,
                                                              ),
                                                              const Gap(20),
                                                              text(
                                                                'Booking Charge: ₹${estimate.bookingCharge}',
                                                                const Color(
                                                                    0xFF5A5A5A),
                                                                16,
                                                                FontWeight.w400,
                                                              ),
                                                              const Gap(5),
                                                              text(
                                                                'Service Charge: ₹${estimate.serviceCharge}',
                                                                const Color(
                                                                    0xFF5A5A5A),
                                                                16,
                                                                FontWeight.w400,
                                                              ),
                                                              const Gap(5),
                                                              text(
                                                                'Travel Allowance: ₹${estimate.travelAllowance}',
                                                                const Color(
                                                                    0xFF5A5A5A),
                                                                16,
                                                                FontWeight.w400,
                                                              ),
                                                              const Gap(5),
                                                              text(
                                                                'Total Distance:  ${estimate.totalDistance} km',
                                                                const Color(
                                                                    0xFF5A5A5A),
                                                                16,
                                                                FontWeight.w400,
                                                              ),
                                                              const Gap(10),
                                                              text(
                                                                'Total Cost:  ₹${estimate.totalCost}',
                                                                const Color(
                                                                    0xFF2E2E2E),
                                                                18,
                                                                FontWeight.w600,
                                                              ),
                                                              const Gap(20),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  customButton(
                                                                    label:
                                                                        'Cancel',
                                                                    icon: null,
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                  Consumer<
                                                                      Addressprovider>(
                                                                    builder: (context,
                                                                        addressProvider,
                                                                        child) {
                                                                      return customButton(
                                                                        label: addressProvider.isLoading
                                                                            ? ''
                                                                            : 'Pay Now',
                                                                        icon: addressProvider.isLoading
                                                                            ? null
                                                                            : Icons.arrow_forward,
                                                                        isLoading:
                                                                            addressProvider.isLoading,
                                                                        onPressed: addressProvider.isLoading
                                                                            ? null
                                                                            : () async {
                                                                                addressProvider.setLoading(true); // 🔄 Start loading

                                                                                final bookingProvider = Provider.of<BookingProviderUser>(context, listen: false);
                                                                                final result = await bookingProvider.addBookingPro();
                                                                                if (!result['success']) {
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(content: Text(result["message"] ?? "Booking failed")),
                                                                                  );
                                                                                  addressProvider.setLoading(false);
                                                                                  return;
                                                                                }

                                                                                await bookingProvider.fetchBookingPro(); // Fetch bookings
                                                                                // ✅ Clear booking selections after booking is confirmed
                                                                                bookingProvider.setSelectedDeviceID(null);
                                                                                bookingProvider.setSelectedServiceID('');
                                                                                bookingProvider.setSelectedTechnicianID(null);
                                                                                bookingProvider.setSelectedAddressID(null, null);
                                                                                bookingProvider.setIssueDescription('');
                                                                                addressProvider.setLoading(false);
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(content: Text("Booking confirmed and added successfully",style: TextStyle(color: Colors.white), ),
                                                                                  backgroundColor:  Colors.green,
                                                                                  behavior: SnackBarBehavior.floating,
                                                                                  shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                           ),
                                                                                  ),
                                                                                ); // ✅ Stop loading
                                                                                Navigator.pushReplacement(
                                                                                  context,
                                                                                  MaterialPageRoute(builder: (_) => UserBottom()),
                                                                                );
                                                                                // Close dialog
                                                                              },
                                                                      );
                                                                    },
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                        );
                                      }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } finally {
                  addressProvider.setLoading(false);
                }
              }),
  );
}
