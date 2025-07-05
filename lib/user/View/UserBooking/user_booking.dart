
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/View/UserBooking/bookingDettail.dart';
import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
import 'package:mobile_servies/user/view/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/viewmodel/bookingProvider.dart';
import 'package:provider/provider.dart';

class UserBooking extends StatefulWidget {
  final bool showBackButton;
  const UserBooking({super.key,this.showBackButton = false});

  @override
  State<UserBooking> createState() => _UserBookingState();
}

class _UserBookingState extends State<UserBooking> {
  @override
  void initState() {
    super.initState();
    fetchBookings(); // ✅ UPDATED - extracted to method
  }

  Future<void> fetchBookings() async {
    await Provider.of<BookingProviderUser>(context, listen: false).fetchBookingPro();
  }

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProviderUser>(context);
    return Scaffold(
      body: 
         Stack(
          children: [
            Positioned(top: 60, left: 20, child: AppLogo()),
            Column(
              children: [
                const Gap(150),
                containers(
                  bookingProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : bookingProvider.bookings.isEmpty
                          ? Center(
                              child: text("No Bookings Found", Colors.red, 25, FontWeight.bold),
                            )
                          : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (widget.showBackButton)
                                    Positioned(
                                      top: 100,
                                      right: 10,
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back,
                                            color: Colors.black),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    TextConstants.deviceSer,
                                    style: GoogleFonts.poppins(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF2E2E2E),
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
                                const Gap(8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    TextConstants.serviceHis,
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF718355),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                Expanded(
                                  child: ListView.builder(
                                    
                                    itemCount: bookingProvider.bookings.length,
                                    itemBuilder: (context, index) {
                                      final booking = bookingProvider.bookings[index];
                                      print("✅ Booking: ${booking.device}, ${booking.service}, ${booking.technician}");

                                      print("📍 Booking: ${booking.device}");
                                      return Card(
                                        color: const Color(0xFFE9F5DB),
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        margin: const EdgeInsets.symmetric(vertical: 8),
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(15),
                                          onTap: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => BookingDetailPage(
                                                  booking: booking, // ✅ Pass only booking
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    icon(Icons.devices, Colors.green),
                                                    const Gap(10),
                                                    Text(
                                                      "Device: ${booking.device ?? ''}",
                                                      style: GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w600,
                                                        color: const Color.fromARGB(255, 111, 111, 111),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(8),
                                                Row(
                                                  children: [
                                                    icon(Icons.build, Colors.green),
                                                    const Gap(10),
                                                    Text(
                                                      "Service: ${booking.service ?? ''}",
                                                      style: GoogleFonts.openSans(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400,
                                                        color: const Color.fromARGB(255, 111, 111, 111),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(8),
                                                Row(
                                                  children: [
                                                    icon(Icons.person, Colors.green),
                                                    const Gap(10),
                                                    Text(
                                                      "Technician: ${booking.technician ?? ''}",
                                                      style: GoogleFonts.openSans(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w400,
                                                        color: const Color.fromARGB(255, 111, 111, 111),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                ),
              ],
            ),
          ],
        ),
      
    );
  }
}
