import 'package:flutter/material.dart';

void main() => runApp(const FitnessApp());

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Discover New Workouts'),
          backgroundColor: Colors.teal,
        ),
        body: WorkoutScrollView(),
      ),
    );
  }
}

class WorkoutScrollView extends StatelessWidget {
  final List<Map<String, String>> workouts = [
    {'title': 'Cardio', 'exercises': '10 Exercises', 'time': '50 Minutes'},
    {'title': 'Arms', 'exercises': '6 Exercises', 'time': '35 Minutes'},
    {'title': 'Yoga', 'exercises': '8 Exercises', 'time': '45 Minutes'},
    {'title': 'Legs', 'exercises': '12 Exercises', 'time': '60 Minutes'},
  ];

  WorkoutScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: workouts.map((workout) => WorkoutCard(workout)).toList(),
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final Map<String, String> workout;

  const WorkoutCard(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              workout['title']!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              workout['exercises']!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            Text(
              workout['time']!,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
