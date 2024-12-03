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
        title: const Text('Food List'),
        centerTitle: true,
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
                    padding: const EdgeInsets.all(12),
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Nutritional Information',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FractionColumnWidth(0.5),
                      1: FractionColumnWidth(0.5),
                    },
                    children: [
                      buildRow(['Nutrients', 'Contain per 100g'],
                          isHeader: true),
                      buildRow(['Calories', '164 kcal']),
                      buildRow(['Protein', '8.9 g']),
                      buildRow(['Total fat :', '2.6 g']),
                      buildRow(['- Saturated', '0.27 g']),
                      buildRow(['- Unsaturated', '0.58 g']),
                      buildRow(['- Monosaturated', '1.16 g']),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
          children: cells.map((cell) {
        final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 16);
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isHeader
                ? const Color.fromARGB(255, 123, 127, 172)
                : Colors.white,
          ),
          child: Center(
              child: Text(
            cell,
            style: style,
          )),
        );
      }).toList());
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
