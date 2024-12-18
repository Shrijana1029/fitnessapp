import 'package:fitnessapp/screens/manage_profle.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> fetchDocuments() async {
    try {
      //refernece to specific document in firestore not collection'
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('user_info')
          .doc('5SjdRTlAckTQq3EunMB9');
      //fetching the document takng snap of datas
      DocumentSnapshot docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        //accessing the data from the document
        var data = docSnapshot.data() as Map<String, dynamic>;
        print('your name is : ${data['name']}');
      } else {
        print('DOCUMENT DOESNT EXISTS');
      }
    } catch (e) {
      print('error fetching the document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManageProfle()));
            },
            child: ClipOval(
              child: Image.asset(
                'assets/img/user.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger)),
        ],
        backgroundColor: const Color.fromARGB(255, 184, 216, 201),
      ),
      body: InkWell(
        onTap: () {
          fetchDocuments();
        },
        child: Text('click me'),
      ),
    );
  }
}
