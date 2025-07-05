import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/user/UserModel/RepairModel/repairModel.dart';
import 'package:mobile_servies/user/View/UserBooking/userbookingWidget.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

class BookingDetailPage extends StatefulWidget {
  final BookingModelUser booking;
  const BookingDetailPage({super.key, required this.booking});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  bool isCustomerDetailsExpanded = false;

  @override
  Widget build(BuildContext context) {
    final booking = widget.booking;
    final cost = booking.costDetails;

    return Scaffold(
      body: Column(
        children: [
          const Gap(100),
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
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking Details",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2E2E2E),
                            ),
                          ),
                          IconButton(
                            icon: icon(Icons.arrow_back, const Color(0xFF5A5A5A)),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const Gap(20),

                      // Booking Info Card
                      Card(
                        color: const Color.fromARGB(255, 218, 243, 179),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              rowWidget("Device:", booking.device ?? '', 20),
                              const Gap(10),
                              rowWidget("Service:", booking.service ?? '', 20),
                              const Gap(10),
                              rowWidget("Date:", formatDateTime(booking.date ?? ''), 20),

                              const Gap(10),
                              rowWidget("Status:", booking.status ?? '', 20, color: Colors.green),
                              const Gap(10),
                              rowWidget("Technician:", booking.technician ?? '', 20),
                              const Gap(10),
                              rowWidget("Payment:", booking.payment ?? '', 20),
                            ],
                          ),
                        ),
                      ),
                      const Gap(30),

                      // Cost Breakdown
                      Text(
                        "Cost Breakdown",
                        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const Gap(15),
                      if (cost != null) ...[
  bulletRichText("Service Charge:", "₹${cost.serviceCharge.toStringAsFixed(2)}"),
  const Gap(10),
  bulletRichText("Travel Allowance:", "₹${cost.travelAllowance.toStringAsFixed(2)}"),
  const Gap(10),
  bulletRichText("Booking Charge:", "₹${cost.bookingCharge.toStringAsFixed(2)}"),
  const Gap(10),
  bulletRichText("Total Cost:", "₹${cost.totalBookingCost.toStringAsFixed(2)}"),
] else
  const Text("Cost details not available", style: TextStyle(color: Colors.red)),


                      const Gap(30),

                      // Toggle Customer Details
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isCustomerDetailsExpanded = !isCustomerDetailsExpanded;
                            });
                          },
                          child: Row(
                            children: [
                              Text(
                                isCustomerDetailsExpanded ? "Hide Customer Details" : "Show Customer Details",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 85, 105, 53),
                                ),
                              ),
                              Icon(
                                isCustomerDetailsExpanded
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: const Color(0xFF718355),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(10),

                      // Customer Details
                      if (isCustomerDetailsExpanded)
                        Card(
                          color: const Color.fromARGB(255, 218, 243, 179),
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer Details',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF2E2E2E),
                                  ),
                                ),
                                const Gap(15),
                                rowWidget("Name:", booking.customerName ?? '', 20),
                                const Gap(10),
                                rowWidget("Email:", booking.email ?? '', 20,color: const Color.fromARGB(255, 1, 95, 173)),
                                const Gap(10),
                                rowWidget("Phone:", booking.phone ?? '', 20),
                                const Gap(10),
                                rowWidget("Address:", "${booking.street ?? ''}, ${booking.city ?? ''}, ${booking.pincode ?? ''}", 20),
                              ],
                            ),
                          ),
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
