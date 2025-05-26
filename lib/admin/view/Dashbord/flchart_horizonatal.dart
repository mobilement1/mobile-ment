// import 'package:flutter/material.dart';

// class HorizontalBarChart extends StatelessWidget {
//   const HorizontalBarChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
//     final values = [10.0, 14.0, 8.0, 12.0, 6.0];
//     final maxBarValue = 20.0;

//     return SizedBox(
//       height: 320,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Left labels column
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: labels
//                 .map(
//                   (label) => Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12.0),
//                     child: Text(
//                       label,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           const SizedBox(width: 16),
//           // Bars Column
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: values
//                   .map(
//                     (value) => Bar(
//                       value: value,
//                       maxValue: maxBarValue,
//                       gradientColors: const [
//                         Color(0xFF42A5F5),
//                         Color(0xFF26C6DA),
//                       ],
//                     ),
//                   )
//                   .toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Bar extends StatelessWidget {
//   final double value;
//   final double maxValue;
//   final List<Color> gradientColors;

//   const Bar({
//     Key? key,
//     required this.value,
//     required this.maxValue,
//     this.gradientColors = const [Colors.blue, Colors.lightBlueAccent],
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       final maxWidth = constraints.maxWidth;
//       final barWidth = (value / maxValue) * maxWidth;

//       return Stack(
//         children: [
//           // Background track
//           Container(
//             height: 28,
//             width: maxWidth,
//             decoration: BoxDecoration(
//               color: Colors.blueGrey.shade100,
//               borderRadius: BorderRadius.circular(14),
//             ),
//           ),

//           // Foreground bar with gradient and shadow
//           Container(
//             height: 28,
//             width: barWidth,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(14),
//               gradient: LinearGradient(
//                 colors: gradientColors,
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: gradientColors.last.withOpacity(0.6),
//                   offset: const Offset(3, 3),
//                   blurRadius: 6,
//                 ),
//               ],
//             ),
//           ),

//           // Value text centered inside bar
//           Positioned.fill(
//             child: Center(
//               child: Text(
//                 value.toString(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   shadows: [
//                     Shadow(
//                       color: Colors.black38,
//                       offset: Offset(1, 1),
//                       blurRadius: 2,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }




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
              Color(0xFFF06292),
              Color(0xFFF44336),
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
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );
    });
  }
}
