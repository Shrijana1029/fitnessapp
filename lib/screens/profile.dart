import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Macro'),
          Row(
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    radius: 40,
                    percent: 2 / 3,
                    // color: Colors.blue,
                    backgroundColor: Colors.grey,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
