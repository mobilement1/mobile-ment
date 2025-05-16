import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_servies/view/Dashbord/widject.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  List<String> bookingStatuses = ['Pending', 'Accepted', 'Completed'];
  String selectedStatus = 'Pending'; // default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Mobile",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(8),
            Text(
              "Mend",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Admin Dashboard",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Text(
              "Manage bookings, services, devices, and technicians.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Gap(20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: whiteButtonStyle,
                        onPressed: () {},
                        child: Text("Dashboard"),
                      ),
                      ElevatedButton(
                        style: whiteButtonStyle,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Bookingpage(),
                              ));
                        },
                        child: Text("Bookings"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: whiteButtonStyle,
                        onPressed: () {},
                        child: Text("Services"),
                      ),
                      ElevatedButton(
                        style: whiteButtonStyle,
                        onPressed: () {},
                        child: Text("Devices"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: whiteButtonStyle,
                        onPressed: () {},
                        child: Text("Technicians"),
                      ),
                      ElevatedButton(
                        style: whiteButtonStyle,
                        onPressed: () {},
                        child: Text("Technician Requests"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: whiteButtonStyle,
                          onPressed: () {},
                          child: Text("Completed Orders"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Admin Dashboard",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedStatus,
                  items: bookingStatuses.map((String status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedStatus = newValue!;
                    });
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Booking ID"),
                        Gap(10),
                        Text("Customer"),
                        Gap(10),
                        Text('Device'),
                        Gap(10),
                        Text("Service"),
                        Gap(10),
                        Text("Date & \n Time"),
                        Gap(10),
                        Text("Technician"),
                        Gap(10),
                        Text("Status"),
                        Gap(10),
                        Text("Price"),
                        Gap(10),
                        Text("Action")
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      children: [Text("data"), Text("data")],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
