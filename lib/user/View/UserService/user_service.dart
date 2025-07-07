import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mobile_servies/user/View/UserHome/homeHeader.dart';
import 'package:mobile_servies/user/View/UserHome/user_homewidget.dart';
import 'package:mobile_servies/user/constants/textconstants.dart';
import 'package:mobile_servies/user/decoration/decoration.dart';
import 'package:mobile_servies/user/viewmodel/userServiceProvider.dart';
import 'package:provider/provider.dart';

class UserService extends StatefulWidget {
  final bool showBackButton;
  const UserService({super.key, this.showBackButton = false});

  @override
  State<UserService> createState() => _UserServiceState();
}

class _UserServiceState extends State<UserService> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController=TextEditingController();
    Future.delayed(Duration.zero,(){
Provider.of<UserServiceProvider>(context,listen: false).fetchServices();
    });
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Stack(
        children: [
          Positioned(top: 60, left: 20, child: AppLogo()),
          Column(
            children: [
              Gap(150), // Space at the top with green background
              containers(
                SingleChildScrollView(
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
                              child: Row(
                                children: [
                                  Text(
                                    TextConstants.urservice,
                                    style: GoogleFonts.poppins(
                                      fontSize: 38,
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
                                  Gap(30),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            TextConstants.urservice1,
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
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              context.read<UserServiceProvider>().filterServices(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search Services',
                              hintStyle: GoogleFonts.openSans(
                                color: const Color(0xFF8D8D8D),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color(0xFF8D8D8D), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color(0xFF718355), width: 2),
                              ),
                              prefixIcon:
                                  icon(Icons.search, const Color(0xFF5A5A5A)),
                            ),
                            style: GoogleFonts.openSans(
                              color: const Color(0xFF2E2E2E),
                            ),
                          ),
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: text(
                            "Available Services",
                            const Color(0xFF2E2E2E),
                            22,
                            FontWeight.w600,
                          ),
                        ),
                        const Gap(5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: text(
                            "Choose a service to book",
                            const Color(0xFF5A5A5A),
                            16,
                            FontWeight.w400,
                          ),
                        ),
                        const Gap(20),
                        Consumer<UserServiceProvider>(
                          builder: (context,provider,child) {
                            if (provider.isLoading) {
                              return Center(child: CircularProgressIndicator(),);
                            }
                            final services=provider.filteredServices;
                            if (services.isEmpty) {
                              return Center(child: text("No Service Available", Colors.red, 25, FontWeight.bold),);
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: services.length,
                              itemBuilder: (context, index) {
                               final service=services[index];
                                return Card(
                                  color: Color(0xFFE9F5DB),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Text(
        service.serviceName,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 111, 111, 111),
        ),
        overflow: TextOverflow.ellipsis,
      ),
    ),
    if (service.isPopular)
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 85, 105, 53),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.thumb_up_outlined, color:Colors.white, size: 18),
            const Gap(5),
            Text(
              'Popular',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
  ],
),

                                        const Gap(5),
                                        text(
                                          'INR ${service.price.toStringAsFixed(2)}',
                                          Color.fromARGB(255, 111, 111, 111),
                                          16,
                                          FontWeight.w600,
                                        ),
                                        const Gap(7),
                                        text(
                                          service.description,
                                          Color.fromARGB(255, 111, 111, 111),
                                          14,
                                          FontWeight.w400,
                                        ),
                                        const Gap(10),
                                        Row(
                                          children: [
                                            icon(Icons.watch_later_rounded,
                                                Colors.green),
                                            const Gap(5),
                                            text(
                                              '${service.duration} min',
                                              const Color.fromARGB(
                                                  255, 111, 111, 111),
                                              14,
                                              FontWeight.w500,
                                            ),
                                            const Gap(20),
                                            icon(Icons.local_offer_outlined,
                                                Colors.green),
                                            const Gap(5),
                                            text(
                                              service.category,
                                              Color.fromARGB(255, 111, 111, 111),
                                              14,
                                              FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                        const Gap(20),
                                        // Align(
                                        //   alignment: Alignment.centerRight,
                                        //   child: customButton(
                                        //     label: 'Book Now',
                                        //     icon: Icons.arrow_forward,
                                        //     onPressed: () {
                                        //       // Add booking functionality here
                                        //     },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        ),
                        const Gap(20),
                      ],
                    ),
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
