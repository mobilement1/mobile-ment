
// Horizontal Bar Chart
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

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
    final values = [8.0, 20.0, 5.0, 4.0, 3.0, 3.0];
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
              Color(0xFF97A97C), // Light green
              Color(0xFF718355), // Darker green
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
    this.gradientColors = const [Color(0xFF97A97C), Color(0xFF718355)],
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
              Container(
                height: 36,
                width: maxWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5), // Lighter gray background
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              Container(
                height: 35,
                width: barWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: gradientColors,
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
                    value.toInt().toString(),
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
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF5A5A5A), // Adjusted to match subtitle color
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );
    });
  }
}
