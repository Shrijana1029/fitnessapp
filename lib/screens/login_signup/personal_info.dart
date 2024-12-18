import 'package:fitnessapp/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _age = TextEditingController();
  //here collRef is an object thathelp youto react with data collection in firestore
  //such as fetching or storing information
  CollectionReference collRef =
      FirebaseFirestore.instance.collection('user_info');
  Future<void> saveUserInfo() async {
    try {
      await collRef.add({
        'name': _firstname.text.trim(),
        'phone': _phone.text.trim(),
        'last_name': _lastname.text.trim(),
        'age': int.tryParse(_age.text) ?? 0, // Convert age to integer
        'created_at': FieldValue.serverTimestamp(), // Optional for timestamp
      });
      print('user information added successfullyyy');
      scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text('Sucessfully Added')));
    } catch (e) {
      print('failed to add user information: $e');
    }
  }

// height weight age gender
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Enter your personal information",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                // First Name
                const Text("Legal first name"),
                const SizedBox(height: 5),
                TextField(
                  controller: _firstname,
                  decoration: InputDecoration(
                    hintText: "Enter your first name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Last Name
                const Text("Legal last name"),
                const SizedBox(height: 5),
                TextField(
                  controller: _lastname,
                  decoration: InputDecoration(
                    hintText: "Enter your first name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Date of Birth
                const Text("Date of Birth"),
                const SizedBox(height: 5),

                TextField(
                  decoration: InputDecoration(
                    hintText: "00 / 00 / 0000",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 15),
                const Text("Phone Number"),
                const SizedBox(height: 5),
                TextField(
                  controller: _phone,
                  decoration: InputDecoration(
                    hintText: 'Enter',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixText: "+977 ", // Optionally show country code
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                // age
                const Text("Your Age"),
                const SizedBox(height: 5),
                TextField(
                  controller: _age,
                  decoration: InputDecoration(
                    hintText: 'Enter',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // Optionally show country code
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),

                const SizedBox(height: 20),
                // SSN Explanation Box
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.lock, color: Colors.blue),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                text: "Why do we need your information?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                              TextSpan(
                                text: "To make sure you are person hehehhe",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ////////stores the info in frestore////////////////////////
                      saveUserInfo();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
