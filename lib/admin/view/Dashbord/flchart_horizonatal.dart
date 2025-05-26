import 'package:flutter/material.dart';
import 'dart:math'; // Needed for max()


class HorizontalBarChart extends StatelessWidget {
  const HorizontalBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = [
      'Battery Replacement',
      'Screen Replacement',
      'Camera Cleaning',
      'Board Change',
      'Charging Port Repair',
      'Storage Increase'
    ];
    final values = [8.0, 12.0, 5.0, 4.0, 3.0, 3.0];
    
    // ✅ FIXED: Use the highest value in the list for scaling
    final maxBarValue = values.reduce(max);

    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          return Bar(
            value: values[index],
            maxValue: maxBarValue,
            label: labels[index],
            gradientColors: const [
              Color.fromARGB(255, 95, 107, 214),
              Color.fromARGB(228, 110, 161, 171),
            ],
          );
        }),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final double value;
  final double maxValue;
  final String label;
  final List<Color> gradientColors;

  const Bar({
    super.key,
    required this.value,
    required this.maxValue,
    required this.label,
    this.gradientColors = const [Colors.blue, Colors.lightBlueAccent],
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final barWidth = (value / maxValue) * maxWidth;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Background track
              Container(
                height: 35,
                width: maxWidth,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              // Foreground bar
              Container(
                height: 35,
                width: barWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: gradientColors.last.withOpacity(0.6),
                      offset: const Offset(3, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
              // Value text
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      shadows: [
                        Shadow(
                          color: Colors.black38,
                          offset: Offset(1, 1),
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
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );
    });
  }
}
