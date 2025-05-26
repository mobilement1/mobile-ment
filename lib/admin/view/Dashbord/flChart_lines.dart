import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (value, meta) {
              const style = TextStyle(
                color: Colors.white60,
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
                  text = const Text('', style: style);
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
                color: Colors.white60,
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
            colors: [Color(0xFF61DAFB), Color(0xFF61DAFB)],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color(0xFF61DAFB).withOpacity(0.3),
                const Color(0xFF61DAFB).withOpacity(0.0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Bookings Line
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
            colors: [Color(0xFFFF6B8B), Color(0xFFFF6B8B)],
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color(0xFFFF6B8B).withOpacity(0.3),
                const Color(0xFFFF6B8B).withOpacity(0.0),
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
    height: 240, 
    width: double.infinity,
    padding: const EdgeInsets.all(16.0), 
    decoration: BoxDecoration(
      color: const Color(0xFF282845),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(
              color: const Color(0xFF61DAFB),
              label: 'Revenue',
            ),
            const SizedBox(width: 16),
            _buildLegendItem(
              color: const Color(0xFFFF6B8B),
              label: 'Bookings',
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Chart
        Expanded(
          child: LineChartFL(),
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
          color: Colors.white60,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    ],
  );
}