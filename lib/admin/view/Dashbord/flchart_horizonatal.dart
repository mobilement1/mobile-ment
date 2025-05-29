import 'package:flutter/material.dart';
import 'dart:math';

import 'package:mobile_servies/tech/constants/colors.dart'; // Needed for max()


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
            Color.fromARGB(121, 97, 218, 251),Color.fromARGB(144, 97, 218, 251)
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
              Container(
                height: 36,
                width: maxWidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(214, 255, 107, 139),
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
                      color: Colors.white,
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
