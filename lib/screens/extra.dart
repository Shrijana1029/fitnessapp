import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 20),
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
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Shree',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
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
                buildListTile(
                  icon: Icons.currency_exchange,
                  title: 'Currency',
                  subtitle: 'Set display currency',
                ),
                buildListTile(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  subtitle: 'Change or reset your account password',
                ),
                buildListTile(
                  icon: Icons.code,
                  title: 'About Us',
                  subtitle: 'Know more about the developer',
                ),
                buildListTile(
                  icon: Icons.delete_forever,
                  title: 'Delete Account',
                  subtitle:
                      'Permanently remove your account and all of its content',
                  titleColor: Colors.red,
                  subtitleColor: Colors.red,
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
      leading: Icon(icon, color: Colors.black),
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
