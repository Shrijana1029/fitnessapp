import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// import 'package:fitnessapp/main.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 234, 215),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Macros',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildMacroIndicator(
                    label: "Carbohydrates",
                    value: 244,
                    maxValue: 276,
                    color: Colors.teal,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  _buildMacroIndicator(
                    label: "Fat",
                    value: 25,
                    maxValue: 73,
                    color: Colors.purple,
                  ),
                  const SizedBox(
                    width: 40,
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

  Widget _buildMacroIndicator(
      {required String label,
      required double value,
      required double maxValue,
      required Color color}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 10.0,
          percent: value / maxValue,
          center: Text(
            '$value/$maxValue',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        ),
        SizedBox(height: 24),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: color),
        ),
        Text(
          '${maxValue - value} left',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
