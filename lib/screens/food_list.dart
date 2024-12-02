import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
// import 'package:fitnessapp/screens/home.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: const Color.fromARGB(255, 62, 206, 67),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Chickpeas',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    height: 200,
                    child: AnotherCarousel(images: const [
                      AssetImage('assets/img/chickpeas.jpg'),
                      AssetImage('assets/img/chckps.jpg')
                    ])),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMacroIndicator(
                        label: 'Protein',
                        value: 8.9,
                        maxValue: 100,
                        color: Colors.green),
                    _buildMacroIndicator(
                      label: 'Carbs',
                      value: 27,
                      maxValue: 100,
                      color: const Color.fromARGB(255, 165, 144, 137),
                    ),
                    _buildMacroIndicator(
                        label: 'Fats',
                        value: 2.6,
                        maxValue: 100,
                        color: const Color.fromARGB(255, 218, 200, 43))
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                const Card(
                  color: Color.fromARGB(255, 146, 184, 216),
                  shadowColor: Color.fromARGB(255, 90, 42, 42),
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Garbanzo beans, another name for chickpeas, have been cultivated and consumed for thousands of years in Middle Eastern nations.Rich in vitamins, minerals, and fiber, chickpeas may help you control your weight, improve your digestion, and lower your risk of illness, among other health advantages.'),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildMacroIndicator({
    required String label,
    required double value,
    required double maxValue,
    required Color color,
  }) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 40.0,
          lineWidth: 15.0,
          percent: value / maxValue,
          center: Text(
            '$value/$maxValue',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          progressColor: color,
          backgroundColor: color.withOpacity(0.2),
        ),
        const SizedBox(height: 14),
        Text(
          label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
