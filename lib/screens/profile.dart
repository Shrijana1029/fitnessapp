import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
            Text('2350 kcal', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            const Text(
              'Statistic',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  bool isCurrentDay =
                      index == 1; // Example for highlighting Monday
                  return Column(
                    children: [
                      Text(
                        'helo', // Sample values
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
