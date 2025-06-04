
// Line Chart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget LineChartFL() {
  return LineChart(
    LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xFF8D6E63).withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xFF8D6E63).withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),
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
              const style = TextStyle(
                color: Color(0xFF8D6E63),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              );
              Widget text;
              switch (value.toInt()) {
                case 0:
                  text = const Text('Jan', style: style);
                  break;
                case 1:
                  text = const Text('Feb', style: style);
                  break;
                case 2:
                  text = const Text('Mar', style: style);
                  break;
                case 3:
                  text = const Text('Apr', style: style);
                  break;
                case 4:
                  text = const Text('May', style: style);
                  break;
                default:
                  text = const Text('June', style: style);
                  break;
              }
              return SideTitleWidget(
                meta: meta,
                child: text,
              );
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(
                color: Color(0xFF8D6E63),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              );
              String text;
              switch (value.toInt()) {
                case 1:
                  text = '5k';
                  break;
                case 3:
                  text = '10k';
                  break;
                case 5:
                  text = '15k';
                  break;
                default:
                  return Container();
              }
              return Text(text, style: style, textAlign: TextAlign.left);
            },
            reservedSize: 40,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 4,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2.5),
            FlSpot(1, 2.0),
            FlSpot(2, 3.0),
            FlSpot(3, 2.5),
            FlSpot(4, 4.5),
          ],
          isCurved: true,
          gradient: const LinearGradient(
            colors: [Color(0xFF97A97C), Color(0xFF718355)], // Updated to green tones
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                const Color.fromARGB(255, 0, 0, 0).withOpacity(0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.5),
            FlSpot(1, 2.5),
            FlSpot(2, 2.0),
            FlSpot(3, 3.0),
            FlSpot(4, 3.5),
          ],
          isCurved: true,
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 19, 16, 16)], // Updated to gray tones
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 20, 20, 20).withOpacity(0.3),
                const Color(0xFFF5F5F5).withOpacity(0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildChartContainer() {
  return Container(
    height: 400,
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: const Color(0xFFF5F5F5), // Updated to match background
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          offset: const Offset(0, 3),
          blurRadius: 8,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Revenue & Completed Bookings",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2E2E2E),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Monthly performance overview",
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF5A5A5A),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: LineChartFL(),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(
              color: const Color(0xFF718355), // Updated to match line chart
              label: 'Revenue',
            ),
            const SizedBox(width: 16),
            _buildLegendItem(
              color:  Color.fromARGB(255, 20, 20, 20), // Updated to match second line
              label: 'Bookings',
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildLegendItem({required Color color, required String label}) {
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
        style: const TextStyle(
          color: Color(0xFF5A5A5A), 
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    ],
  );
}