import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/admin/controller/dashboard_provider.dart';

Widget buildServiceStatsTab(AdminDashboardProvider provider) {
    if (provider.isLoading && provider.metrics == null) {
      return const Center(child:  CircularProgressIndicator(color:  Color.fromARGB(255, 85, 105, 53)));
    }

    if (provider.error != null) {
      return Center(
        child: Text(
          "Error loading data: ${provider.error}",
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    final services = provider.getPopularServices();
    final maxValue = services.isNotEmpty
        ? services.map((e) => e.count).reduce((a, b) => a > b ? a : b).toDouble()
        : 1.0;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Service Statistics",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2E2E2E),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Most requested services",
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF5A5A5A),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 36,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E5E5),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: (service.count / maxValue) * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF97A97C), Color(0xFF718355)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  offset: const Offset(3, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                service.count.toString(),
                                style: TextStyle(
                                  color: const Color(0xFF2E2E2E),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(1, 1),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        service.type,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5A5A5A),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double calculateMaxY(AdminDashboardProvider provider) {
    if (provider.metrics == null || provider.metrics!.revenueChartData.isEmpty) {
      return 10.0;
    }
    
    final maxRevenue = provider.metrics!.revenueChartData
        .map((e) => e.revenue)
        .reduce((a, b) => a > b ? a : b);
    final maxExpense = provider.metrics!.revenueChartData
        .map((e) => e.expense)
        .reduce((a, b) => a > b ? a : b);
    
    // Convert to thousands and add 20% padding
    return ((maxRevenue > maxExpense ? maxRevenue : maxExpense) / 1000 * 1.2).ceilToDouble();
  }

  Widget buildLegendItem({required Color color, required String label}) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF5A5A5A),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }