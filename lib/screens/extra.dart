// soft green ---> argb(255,184, 216, 201)
// soft grey opacity is 255 --> argb(255,237, 234, 215)
// yello  (255, 233, 218, 115)

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart'; // Add this dependency in pubspec.yaml

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Macros Tracker'),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Macros',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMacroIndicator(
                    label: "Carbohydrates",
                    value: 244,
                    maxValue: 276,
                    color: Colors.teal,
                  ),
                  _buildMacroIndicator(
                    label: "Fat",
                    value: 25,
                    maxValue: 73,
                    color: Colors.purple,
                  ),
                  _buildMacroIndicator(
                    label: "Protein",
                    value: 61,
                    maxValue: 111,
                    color: Colors.orange,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacroIndicator({
    required String label,
    required int value,
    required int maxValue,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 10.0,
          percent: value / maxValue,
          center: Text(
            '$value/$maxValue',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        ),
        SizedBox(height: 44),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          '${maxValue - value} left',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
