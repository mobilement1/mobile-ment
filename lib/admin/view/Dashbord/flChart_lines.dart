import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_servies/admin/controller/dashboard_provider.dart';

Widget buildRevenueTab(AdminDashboardProvider provider) {
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

  final metrics = provider.metrics;
  if (metrics == null || metrics.revenueChartData.isEmpty) {
    return const Center(child: Text("No data available"));
  }

  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Revenue Overview",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2E2E2E)
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Monthly revenue and expenses for this year",
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:  Color(0xFF5A5A5A),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 189, 188, 188).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: calculateMaxY(provider),
                minY: -calculateMaxY(provider),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= metrics.revenueChartData.length) {
                          return const Text('');
                        }
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            metrics.revenueChartData[value.toInt()].month
                                .substring(0, 3),
                            style: TextStyle(
                              color: Color(0xFF5A5A5A),
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: calculateMaxY(provider) / 5,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value >= 0 ? '\₹${value.toInt()}K' : '₹${(-value).toInt()}K',
                          style: TextStyle(
                            color:Color(0xFF5A5A5A),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        );
                      },
                      reservedSize: 40,
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: calculateMaxY(provider) / 5,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color.fromARGB(255, 133, 64, 64).withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                      strokeWidth: 1.5,
                    );
                  },
                ),
                borderData: FlBorderData(show: false),
                barGroups: _getBarGroups(provider),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => Colors.black.withOpacity(0.8),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final value = rod.toY;
                      return BarTooltipItem(
                        value >= 0 ? '\₹${value.toInt()}K' : '₹${(-value).toInt()}K',
                        GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLegendItem(
              color: Colors.green[600]!,
              label: 'Revenue',
            ),
            const SizedBox(width: 16),
            buildLegendItem(
              color: Colors.red[400]!,
              label: 'Expenses',
            ),
          ],
        ),
      ],
    ),
  );
}

List<BarChartGroupData> _getBarGroups(AdminDashboardProvider provider) {
  final metrics = provider.metrics;
  if (metrics == null || metrics.revenueChartData.isEmpty) return [];

  return metrics.revenueChartData.asMap().entries.map((entry) {
    final index = entry.key;
    final data = entry.value;
    return BarChartGroupData(
      x: index,
      barRods: [
        BarChartRodData(
          toY: data.revenue / 1000,
          color: Colors.green[600],
          width: 22,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 0,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
        BarChartRodData(
          toY: -data.expense / 1000, 
          color: Colors.red[400],
          width: 22,
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 0,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ],
    );
  }).toList();
}

Widget buildLegendItem({
  required Color color,
  required String label,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [SizedBox(width: 18),
      Container(
        width: 12,
        height: 12,
        color: color,
      ),
      const SizedBox(width: 18),
      Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5A5A5A),
        ),
      ),
    ],
  );
}

// Calculate Max Y (updated to handle both revenue and expense)
double calculateMaxY(AdminDashboardProvider provider) {
  final metrics = provider.metrics;
  if (metrics == null || metrics.revenueChartData.isEmpty) return 10.0;
  final revenueMax = metrics.revenueChartData
      .map((e) => e.revenue)
      .reduce((a, b) => a > b ? a : b);
  final expenseMax = metrics.revenueChartData
      .map((e) => e.expense)
      .reduce((a, b) => a > b ? a : b);
  return (revenueMax > expenseMax ? revenueMax : expenseMax).ceilToDouble() /
      1000; // Convert to thousands
}