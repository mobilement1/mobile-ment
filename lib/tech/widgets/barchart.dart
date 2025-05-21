import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_servies/tech/constants/colors.dart';

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

    const double fixedBarWidth = 35;
    const double groupSpacing = 20;
    final double chartWidth =
        months.length * (metrics.length * fixedBarWidth + groupSpacing * 2);
        

    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade900,
                  AppColors.appBarBg,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: chartWidth,
                child: BarChart(
                  BarChartData(
                    maxY: maxValue + (maxValue * 0.2),
                    minY: 0,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: maxValue / 4,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                color: Colors.white70,
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
                                style: const TextStyle(
                                  color: Colors.white70,
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
                            gradient: LinearGradient(
                              colors: [
                                colors[metricIndex],
                                colors[metricIndex].withOpacity(0.7),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            width: fixedBarWidth,
                            borderRadius: BorderRadius.circular(8),
                            backDrawRodData: BackgroundBarChartRodData(
                              toY: maxValue + (maxValue * 0.2),
                              color: Colors.white.withOpacity(0.05),
                            ),
                          ),
                        ),
                        showingTooltipIndicators: List.generate(metrics.length, (index) => index),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: maxValue / 4,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.white.withOpacity(0.1),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipPadding: const EdgeInsets.all(8),
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            '${metrics[rodIndex]}\n${rod.toY.toStringAsFixed(1)}',
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    alignment: BarChartAlignment.spaceEvenly,
                    groupsSpace: groupSpacing,
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 800),
                  swapAnimationCurve: Curves.easeInOut,
                ),
              ),
            ),
          ),
        ),
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
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: colors[index],
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      metrics[index],
                      style: const TextStyle(
                        color: Colors.white70,
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
    );
  }
}



