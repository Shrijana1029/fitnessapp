import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/firebase_services/firebase_auth.dart';
import 'package:flutter/material.dart';

class SetGoal extends StatefulWidget {
  const SetGoal({super.key});

  @override
  State<SetGoal> createState() => _SetGoalState();
}

final AuthService _auth = AuthService();
User? user;
DocumentReference<Map<String, dynamic>>? userDoc;

class _SetGoalState extends State<SetGoal> {
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userDoc =
          FirebaseFirestore.instance.collection('user_info').doc(user!.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Goal'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 200, 201, 157),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50, // Set a height for the Row
                    child: FutureBuilder<Map<String, dynamic>?>(
                      future: _auth.fetchUserData(userDoc),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData && snapshot.data != null) {
                          var userData = snapshot.data!;

                          // Validate required keys
                          bool hasAllFields = userData.containsKey('height') &&
                              userData.containsKey('weight') &&
                              userData.containsKey('age') &&
                              userData.containsKey('gender');

                          if (hasAllFields) {
                            // Safely parse data to correct types
                            double userHeight = userData['height'] is int
                                ? (userData['height'] as int).toDouble()
                                : userData['height'];
                            double userWeight = userData['weight'] is int
                                ? (userData['weight'] as int).toDouble()
                                : userData['weight'];
                            int userAge = userData['age'];
                            String userGender = userData['gender'];

                            // Calculate fat percentage
                            final fatCalculation = FatCalculation(
                              userweight: userWeight,
                              userHeight: userHeight,
                              userage: userAge,
                              usergender: userGender,
                            );
                            final fatPercentage =
                                fatCalculation.calculateFatPercentage();

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Weight'),
                                      Text('$userWeight kg'),
                                    ],
                                  ),
                                ),
                                const VerticalDivider(
                                    thickness: 1,
                                    width: 1,
                                    color: Colors.black),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text('Total Fat'),
                                      Text(
                                        '${fatPercentage.toStringAsFixed(2)}%',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            // Identify missing fields
                            List<String> missingFields = [];
                            if (!userData.containsKey('height')) {
                              missingFields.add('Height');
                            }
                            if (!userData.containsKey('weight')) {
                              missingFields.add('Weight');
                            }
                            if (!userData.containsKey('age')) {
                              missingFields.add('Age');
                            }
                            if (!userData.containsKey('gender')) {
                              missingFields.add('Gender');
                            }

                            return Column(
                              children: [
                                const Text(
                                  'Incomplete data for calculation.',
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  'Missing fields: ${missingFields.join(', ')}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            );
                          }
                        }
                        return const Text('No data available.');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FatCalculation {
  final double userweight; // Weight in kg
  final double userHeight; // Height in cm
  final int userage; // Age in years
  final String usergender; // Gender ("male" or "female")

  FatCalculation({
    required this.userweight,
    required this.userHeight,
    required this.userage,
    required this.usergender,
  });

  double calculateFatPercentage() {
    // Convert height to meters for BMI calculation
    double heightInMeters = userHeight / 100;

    // Calculate BMI
    double bmi = userweight / (heightInMeters * heightInMeters);

    // Calculate BFP based on gender
    double fatPercentage;
    if (usergender.toLowerCase() == "male") {
      fatPercentage = (1.20 * bmi) + (0.23 * userage) - 16.2;
    } else {
      fatPercentage = (1.20 * bmi) + (0.23 * userage) - 5.4;
    }

    return fatPercentage;
  }
}
