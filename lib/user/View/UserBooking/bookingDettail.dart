import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/user/View/UserBooking/userbookingWidget.dart';
import 'package:mobile_servies/user/view/userhome/user_homewidget.dart';

class BookingDetailPage extends StatefulWidget {
  final Map<String, String> booking;

  const BookingDetailPage({super.key, required this.booking});

  @override
  State<BookingDetailPage> createState() => _BookingDetailPageState();
}

class _BookingDetailPageState extends State<BookingDetailPage> {
  bool isCustomerDetailsExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Booking Details", Colors.white, 25, FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: const Color(0x3361DAFB),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: icon(Icons.close, Colors.white)),
                        rowWidget("Device: ", '${widget.booking['device']}', 50),
                        Gap(10),
                        rowWidget("Service: ", '${widget.booking['service']}', 50),
                        Gap(10),
                        rowWidget("Date:", '${widget.booking['date']}', 70),
                        Gap(10),
                        rowWidget("status:", ' ${widget.booking['status']}', 50,color: Colors.blue),
                        Gap(10),
                        rowWidget("Technician:", ' ${widget.booking['technician']}', 15),
                        Gap(10),
                        rowWidget("Payment:", ' ${widget.booking['payment']}', 30),
                        Gap(10),
                      ],
                    ),
                  ),
                ),
              
              ),
              Gap(30),
              Align(
                alignment: Alignment.topLeft,
                child: text('Cost Breakdown', Colors.white, 25, FontWeight.bold)),
              Gap(15),
              bulletText('Service Charge : ₹399', const Color.fromARGB(255, 173, 172, 172), 20, FontWeight.normal),
              Gap(10),
              bulletText('Travel Allowance :₹157.43', const Color.fromARGB(255, 173, 172, 172), 20, FontWeight.normal),
              Gap(10),
              bulletText('Booking Charge: ₹199', const Color.fromARGB(255, 173, 172, 172), 20, FontWeight.normal),
              Gap(10),
              bulletText('Total Cost: ₹755.43', Colors.white, 20, FontWeight.bold),
Gap(30),
       InkWell(
        onTap: () {
                  setState(() {
                    isCustomerDetailsExpanded = !isCustomerDetailsExpanded;
                  });
                },
                child: Row(children: [
                  text(
                      isCustomerDetailsExpanded ? "Show Customer Details" :"Hide Details" ,
                       Colors.blue, 20,FontWeight.bold
                    ),
                    Icon(
                      isCustomerDetailsExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                      color: Colors.blue,weight: 25,
                    )
                ],),
       ),
       Gap(10),
       if (isCustomerDetailsExpanded)
                Card(
                  color: const Color(0x3361DAFB),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text('Customer Details', Colors.white, 22, FontWeight.bold),
                        Gap(15),
                        rowWidget("Name:","Zeenath" , 30),
                        Gap(10),
                        rowWidget("Email:","zeenathtc961@gmail.com", 30),
                        Gap(10),
                        rowWidget("Phone:", "7306706964", 30),
                        Gap(10),
                        rowWidget("Address:", "Pallikkal Bazar, Malappuram - 673638", 10),
                      ],
                    ),
                  ),
                ),
      
            ],
          ),
        ),
      ),

    );
  }
}
