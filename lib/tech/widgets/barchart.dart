


import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBarChart extends StatelessWidget {
  final Map<String, Map<String, double>> monthlyData;
  final List<Color> colors;
  final List<String> metrics;

  const CustomBarChart({
    super.key,
    required this.monthlyData,
    required this.colors,
    required this.metrics,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> months = monthlyData.keys.toList();
    final double maxValue = monthlyData.values
        .expand((metric) => metric.values)
        .reduce((a, b) => a > b ? a : b);

    const double fixedBarWidth = 25;
    const double groupSpacing = 20;
    final double chartWidth =
        months.length * (metrics.length * fixedBarWidth + groupSpacing * 2);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Container(
            width: chartWidth,
            height: 340,
            padding: const EdgeInsets.all(16),
            child: BarChart(
              BarChartData(
                maxY: (maxValue < 100 ? 100 : maxValue + maxValue * 0.2),
                minY: 0,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: maxValue / 4,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: GoogleFonts.openSans(
                            color: const Color(0xFF5A5A5A),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                      reservedSize: 40,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            index < months.length ? months[index] : '',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF2E2E2E),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      },
                      interval: 1,
                      reservedSize: 30,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barGroups: List.generate(
                  months.length,
                  (monthIndex) => BarChartGroupData(
                    x: monthIndex,
                    barRods: List.generate(
                      metrics.length,
                      (metricIndex) => BarChartRodData(
                        toY: monthlyData[months[monthIndex]]![metrics[metricIndex]] ?? 0,
                        color: colors[metricIndex],
                        width: fixedBarWidth,
                        borderRadius: BorderRadius.circular(8),
                        backDrawRodData: BackgroundBarChartRodData(
                          toY: maxValue + (maxValue * 0.2),
                          color: const Color(0xFF8D8D8D).withOpacity(0.1),
                        ),
                      ),
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxValue / 4,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: const Color(0xFF8D8D8D).withOpacity(0.2),
                      strokeWidth: 1,
                    );
                  },
                ),
                alignment: BarChartAlignment.spaceEvenly,
                groupsSpace: groupSpacing,
              ),
              swapAnimationDuration: const Duration(milliseconds: 800),
              swapAnimationCurve: Curves.easeInOut,
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(metrics.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      const Gap(8),
                      Text(
                        metrics[index],
                        style: GoogleFonts.openSans(
                          color: const Color(0xFF5A5A5A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}