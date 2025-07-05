import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/UserModel/AddressModel/addressModel.dart';
import 'package:mobile_servies/user/View/UserBookingSection/showDialogueScrn.dart';
import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/viewmodel/addressProvider.dart';
import 'package:mobile_servies/user/viewmodel/bookingProvider.dart';
import 'package:mobile_servies/user/viewmodel/serviceDeviseProvider.dart';
import 'package:provider/provider.dart';

class BookRepairPage extends StatefulWidget {
  const BookRepairPage({super.key});

  @override
  State<BookRepairPage> createState() => _BookRepairPageState();
}

class _BookRepairPageState extends State<BookRepairPage> {
  List<String> savedAddresses = [];
  bool addressAvailable = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final bookingProvider =
          Provider.of<BookingProviderUser>(context, listen: false);
      final addressProvider =
          Provider.of<Addressprovider>(context, listen: false);

      await addressProvider.getAddressList();
      await addressProvider.loadSelectedAddress();
      Provider.of<DeviceServiceProvider>(context, listen: false)
          .fetchServices();
      Provider.of<DeviceServiceProvider>(context, listen: false).fetchDevices();
   bookingProvider.setSelectedAddressID(
  addressProvider.selectedAddressID,
  addressProvider.addressList.firstWhere(
    (address) => address.id == addressProvider.selectedAddressID,
    orElse: () => AddressModel(
      id: '', addressDetail: '', city: '', pincode: '', state: '', street: '', latitude: 0.0, longitude: 0.0,
    ),
  ),
);

    });
  }

  String normalize(String? value) {
    return value?.trim().toLowerCase() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<Addressprovider>(context);
    final deviceserviceProvider = Provider.of<DeviceServiceProvider>(context);
    final bookingProviders = Provider.of<BookingProviderUser>(context);
    return Scaffold(
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
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              TextConstants.book1,
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
                            icon:
                                icon(Icons.arrow_back, const Color(0xFF5A5A5A)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const Gap(8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: text(TextConstants.convenience,
                            Color(0xFF5A5A5A), 16, FontWeight.w400),
                      ),
                      const Gap(30),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: text(
                            TextConstants.selectDevice,
                            Color(0xFF2E2E2E),
                            22,
                            FontWeight.w600,
                          )),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: buildDropdown(
                            value: deviceserviceProvider.selectedDevice,
                            items: deviceserviceProvider.devices
                                .map((d) => d.deviceName.trim())
                                .toList(),
                            hintText: TextConstants.selectDevice,
                            onChanged: (String? selectedName) {
                              try {
                                final selected =
                                    deviceserviceProvider.devices.firstWhere(
                                  (d) =>
                                      normalize(d.deviceName) ==
                                      normalize(selectedName),
                                );
                                deviceserviceProvider.setSelectedDevice(
                                    selected.deviceName.trim(),
                                    selected.deviceId);
                                bookingProviders.selectedDeviceID =
                                    selected.deviceId;
                                bookingProviders
                                    .setSelectedDeviceID(selected.deviceId);
                                log("✅ Device matched: ${selected.deviceId}");
                              } catch (e) {
                                log("❌ Device not found: $selectedName");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Selected device not found. Please try again.")),
                                );
                              }
                            }),
                      ),
                      const Gap(20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: text(
                            TextConstants.selectService,
                            Color(0xFF2E2E2E),
                            22,
                            FontWeight.w600,
                          )),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: buildDropdown(
                            value: deviceserviceProvider.selectedService,
                            items: deviceserviceProvider.services
                                .map((s) => s.serviceName)
                                .toList(),
                            hintText: TextConstants.selectService,
                            onChanged: (String? selectedName) {
                              try {
                                final selected =
                                    deviceserviceProvider.services.firstWhere(
                                  (s) =>
                                      normalize(s.serviceName) ==
                                      normalize(selectedName),
                                );
                                deviceserviceProvider.setSelectedService(
                                    selected.serviceName.trim(),
                                    selected.serviceId);
                                    
                                bookingProviders.selectedServiceID =
                                    selected.serviceId;
                                bookingProviders
                                    .setSelectedServiceID(selected.serviceId);
                                log("✅ Service matched: ${selected.serviceId}");
                              } catch (e) {
                                log("❌ service not found: $selectedName");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Selected service not found. Please try again.")),
                                );
                              }
                            }),
                      ),
                      const Gap(20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: text(
                            TextConstants.selectAddress,
                            Color(0xFF2E2E2E),
                            22,
                            FontWeight.w600,
                          )),
                      const Gap(10),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Card(
                                  color: const Color(0xFFE9F5DB),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.location_on,
                                            color: Colors.red),
                                        addressProvider.isLoading
                                            ? CircularProgressIndicator()
                                            : Text(
                                                addressProvider
                                                        .selectedAddress ??
                                                    "No address selected",
                                                style: GoogleFonts.openSans(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: addressProvider
                                                              .selectedAddress !=
                                                          null
                                                      ? const Color.fromARGB(
                                                          255, 90, 89, 89)
                                                      : Colors.red,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: customButton(
                                      label: "Select Address",
                                      onPressed: () async {
                                        Provider.of<Addressprovider>(context,
                                                listen: false)
                                            .getAddressList();
                                        showAddressDialog(context);
                                      })),
                            ],
                          )),
                      const Gap(10),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: text(
                            TextConstants.describe,
                            const Color(0xFF2E2E2E),
                            22,
                            FontWeight.w600,
                          )),
                      const Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                            maxLines: 3,
                            style: GoogleFonts.openSans(
                                color: const Color(0xFF2E2E2E)),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: TextConstants.describe,
                              hintStyle: GoogleFonts.openSans(
                                  color: const Color(0xFF8D8D8D)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 14),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF8D8D8D), width: 1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF718355), width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: bookingProviders.setIssueDescription),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: showScreen(context),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
