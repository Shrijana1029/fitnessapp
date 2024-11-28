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
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Macros',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _cards(
                      name: 'Steps',
                      data: '18',
                      goal: '12.0000 steps',
                      icon2: Icons.numbers,
                      icon3: Icons.cloud_circle),
                  _cards(
                      name: 'Exercises',
                      data: '204 cal',
                      goal: '00.25hr',
                      icon1: Icons.add,
                      icon2: Icons.fireplace_rounded,
                      icon3: Icons.timelapse_outlined),
                  // _cards(name: 'Rajina'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ////MACROSSSSSSSSSSS

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
  //////CARDDDDDDDDDDSSSSSS

  Widget _cards(
      {required String name,
      required String data,
      required String goal,
      IconData? icon1,
      required IconData icon2,
      required IconData icon3}) {
    return Card(
        color: Theme.of(context).primaryColorDark,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    icon1,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    icon2,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    icon3,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 8),
                  Text(
                    goal,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
