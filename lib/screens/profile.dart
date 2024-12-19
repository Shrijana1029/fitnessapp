import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/screens/manage_profle.dart';
import 'package:flutter/material.dart';
// import 'package:fitnessapp/screens/manage_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user;
  DocumentReference<Map<String, dynamic>>? userDoc;

  @override
  //stores the uid of logged-in user
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //points to user document who is logged in
      userDoc =
          FirebaseFirestore.instance.collection('user_info').doc(user!.uid);
    }
  }

  Future<Map<String, dynamic>?> fetchUserData() async {
    if (userDoc != null) {
      try {
        //take snapshot of data
        DocumentSnapshot<Map<String, dynamic>> docSnapshot =
            await userDoc!.get();
        if (docSnapshot.exists) {
          return docSnapshot.data();
        } else {
          print('Document does not exist');
        }
      } catch (e) {
        print('Error fetching document: $e');
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ManageProfile()),
              );
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
      body: FutureBuilder<Map<String, dynamic>?>(
        future: fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            var userData = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${userData['name'] ?? 'N/A'}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email: ${userData['email'] ?? 'N/A'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  // Add more fields as necessary
                ],
              ),
            );
          } else {
            return const Center(child: Text('No user data found.'));
          }
        },
      ),
    );
  }
}
