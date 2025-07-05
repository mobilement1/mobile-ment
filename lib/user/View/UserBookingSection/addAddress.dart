import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

import 'package:mobile_servies/user/View/UserBookingSection/user_bookingsection_widget.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/viewmodel/addressProvider.dart';
import 'package:provider/provider.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final LatLng initialLocation = LatLng(10.8505, 76.2711);
  final MapController mapController = MapController();

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
                child:
                    Consumer<Addressprovider>(builder: (context, value, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                        child: customTextField(
                          controller: value.addressName,
                          labelText: "Address Name",
                          prefixIcon: Icons.home_outlined,
                        ),
                      ),
                      const Gap(16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: customTextField(
                          controller: value.streetAddress,
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
                              child: customTextField(
                                controller: value.cityController,
                                labelText: "City",
                                prefixIcon: Icons.location_city,
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              child: customTextField(
                                controller: value.stateController,
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
                        child: customTextField(
                          controller: value.pincodeController,
                          labelText: "Zip Code",
                          prefixIcon: Icons.local_post_office_outlined,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            await value
                                .updateLocationFromAddress(); // wait till location is fetched
                            if (value.selectedLatLng != null) {
                              mapController.move(value.selectedLatLng!,
                                  mapController.camera.zoom); // move map
                            }
                          },
                          icon: const Icon(Icons.my_location),
                          label: const Text("Update Location from Address"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                border:
                                    Border.all(color: const Color(0xFF8D8D8D)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Stack(
                                children: [
                                  FlutterMap(
                                    mapController: mapController,
                                    options: MapOptions(
                                      initialCenter: value.selectedLatLng ??
                                          initialLocation,
                                      initialZoom: 13.0,
                                      onTap: (tapPosition, latLng) {
                                        value.setSelectedLocation(latLng);
                                        mapController.move(
                                            latLng, mapController.camera.zoom);
                                      },
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        subdomains: ['a', 'b', 'c'],
                                      ),
                                      if (value.selectedLatLng != null)
                                        MarkerLayer(
                                          markers: [
                                            Marker(
                                              point: value.selectedLatLng!,
                                              width: 40,
                                              height: 40,
                                              child: Icon(
                                                Icons.location_pin,
                                                color: Colors.red,
                                                size: 40,
                                              ),
                                            )
                                          ],
                                        ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 70,
                                    right: 10,
                                    child: FloatingActionButton(
                                      mini: true,
                                      onPressed: () {
                                        final newZoom =
                                            mapController.camera.zoom - 1;
                                        final center =
                                            mapController.camera.center;
                                        mapController.move(center, newZoom);
                                      },
                                      child: const Icon(Icons.remove),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: FloatingActionButton(
                                      mini: true,
                                      heroTag: "zoomIn",
                                      onPressed: () {
                                        final newZoom =
                                            mapController.camera.zoom + 1;
                                        final center =
                                            mapController.camera.center;
                                        mapController.move(center, newZoom);
                                      },
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            value.selectedLatLng == null
                                ? const Text(
                                    "No location selected",
                                    style: TextStyle(color: Colors.grey),
                                  )
                                : Text(
                                    "Selected Location:\n${value.fullAddress}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                          ],
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
                              onPressed: () async {
                                final provider = Provider.of<Addressprovider>(
                                    context,
                                    listen: false);
                                
                                final success =
                                    await provider.addAddressProvider();
                                if (success) {
                                 Navigator.pop(context);
                                  
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            provider.errorMessage.isNotEmpty
                                                ? provider.errorMessage
                                                : "Failed to save address")),
                                  );
                                 
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
