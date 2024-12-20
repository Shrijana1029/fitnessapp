import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnessapp/firebase_services/firebase_auth.dart';
import 'package:fitnessapp/screens/login_signup/change_password.dart';
import 'package:fitnessapp/screens/login_signup/edit_personalInfo.dart';
import 'package:fitnessapp/screens/login_signup/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManageProfile extends StatefulWidget {
  const ManageProfile({super.key});

  @override
  State<ManageProfile> createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  final AuthService _auth = AuthService();
  User? user;
  DocumentReference<Map<String, dynamic>>? userDoc;

  @override
  //stores the uid of logged-in user
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //  / Points to the 'user_info' document with the user's UID as the document ID.
      userDoc =
          FirebaseFirestore.instance.collection('user_info').doc(user!.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/img/user.jpg',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.messenger)),
        ],
        backgroundColor: const Color.fromARGB(255, 184, 216, 201),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ////FUTURE  builder helps to display the fetched data in real time
                const SizedBox(height: 10),
                FutureBuilder<Map<String, dynamic>?>(
                  future: _auth.fetchUserData(userDoc),
                  builder: (context, snapshot) {
                    //wait for future data to avoid null
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    //if data  has error,
                    else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      var userData = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.blue,
                                    child: Text(
                                      '${userData['name'][0].toUpperCase()}',
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditPersonalinfo()));
                                    },
                                    child: Positioned(
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.black,
                                        child: Icon(
                                          Icons.edit,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Center(
                              child: Text(
                                '${userData['name'] ?? 'N/A'}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),
                            Center(
                              child: Text('${userData['email'] ?? 'N/A'}'),
                            )
                            // Add more fields as necessary
                          ],
                        ),
                      );
                    } else {
                      return const Center(child: Text('No user data found.'));
                    }
                  },
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                buildListTile(
                  icon: Icons.info_outline,
                  title: 'Account Information',
                  subtitle: 'View and edit your account information',
                ),
                InkWell(
                  onTap: () {
                    // Navigate to the change password screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen()));
                  },
                  child: buildListTile(
                    icon: Icons.lock_outline,
                    title: 'Change Password',
                    subtitle: 'Change or reset your account password',
                  ),
                ),
                /////////delete user account
                InkWell(
                  onTap: () async {
                    await AuthService().deleteUserAccount();
                    // Navigate after the deletion
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: buildListTile(
                    icon: Icons.delete_forever,
                    title: 'Delete Account',
                    subtitle:
                        'Permanently remove your account and all of its content',
                    titleColor: Colors.red,
                    subtitleColor: Colors.red,
                  ),
                ),
                buildListTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  subtitle: 'Sign out from this device',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Color? titleColor,
    Color? subtitleColor,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: titleColor ?? Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: subtitleColor ?? Colors.grey,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    );
  }
}
