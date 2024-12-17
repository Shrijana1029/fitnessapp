// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ChangePasswordPage extends StatefulWidget {
//   @override
//   _ChangePasswordPageState createState() => _ChangePasswordPageState();
// }

// class _ChangePasswordPageState extends State<ChangePasswordPage> {
//   final _currentPasswordController = TextEditingController();
//   final _newPasswordController = TextEditingController();
//   final _auth = FirebaseAuth.instance;

//   Future<void> _changePassword() async {
//     try {
//       final user = _auth.currentUser;

//       // Step 1: Reauthenticate user
//       final credential = EmailAuthProvider.credential(
//         email: user!.email!,
//         password: _currentPasswordController.text,
//       );
//       try {
//         await user.reauthenticateWithCredential(credential);
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'wrong-password') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Incorrect current password.')),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Error: ${e.message}')),
//           );
//         }
//         return;
//       }

//       // Step 2: Update password
//       await user.updatePassword(_newPasswordController.text);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Password changed successfully!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Change Password')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _currentPasswordController,
//               decoration: InputDecoration(labelText: 'Current Password'),
//               obscureText: true,
//             ),
//             TextField(
//               controller: _newPasswordController,
//               decoration: InputDecoration(labelText: 'New Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _changePassword,
//               child: Text('Change Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
