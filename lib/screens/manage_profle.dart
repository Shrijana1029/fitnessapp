import 'package:fitnessapp/firebase_services/firebase_auth.dart';
import 'package:fitnessapp/screens/login_signup/change_password.dart';
import 'package:fitnessapp/screens/login_signup/signup_page.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ManageProfle extends StatefulWidget {
  const ManageProfle({super.key});

  @override
  State<ManageProfle> createState() => _ManageProfleState();
}

class _ManageProfleState extends State<ManageProfle> {
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
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Shree',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'shrijana.201330@ncit.edu.np',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
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
                    //to navgate to the change password screen
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
                    //to navgate after the deletion
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
