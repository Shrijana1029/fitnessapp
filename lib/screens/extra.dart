// soft green ---> argb(255,184, 216, 201)
// soft grey opacity is 255 --> argb(255,237, 234, 215)
// yello  (255, 233, 218, 115)
//light yellow: Color.fromARGB(255, 252, 227, 138)
import 'package:flutter/material.dart';

void main() => runApp(const FitnessApp());

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FitnessScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calories',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              '2350 kcal',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Statistic',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (index) {
                  bool isCurrentDay =
                      index == 2; // Example for highlighting Monday
                  return Column(
                    children: [
                      Text(
                        '${190 + (index * 30)} kcal', // Sample values
                        style: TextStyle(
                          color:
                              isCurrentDay ? Colors.cyan : Colors.transparent,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: Container(
                          width: 10,
                          height:
                              (50 + index * 10).toDouble(), // Example heights
                          color: isCurrentDay ? Colors.cyan : Colors.yellow,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Mon',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
