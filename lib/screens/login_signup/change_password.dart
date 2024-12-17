import 'package:fitnessapp/screens/login_signup/forgot_password.dart';
import 'package:fitnessapp/screens/login_signup/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitnessapp/main.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureText = true;
  final _currentPasswordController = TextEditingController();

  final _newPasswordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Future<void> _changePassword() async {
    try {
      final user = _auth.currentUser;

      // Step 1: Reauthenticate user
      final credential = EmailAuthProvider.credential(
        email: user!.email!,
        password: _currentPasswordController.text.trim(),
      );

      ///reauth garda kei problem ayo ki catch garxa and display
      await user.reauthenticateWithCredential(credential);

      // Step 2: Update password garxa
      await user.updatePassword(_newPasswordController.text);
      print('sucessfulluy sssssssssssssss');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      scaffoldKey.currentState?.showSnackBar(
          SnackBar(content: Text('SUCESFULLY PASWWORD CHNEGD BROO')));
    } catch (e) {
      print('error is : ${e.toString()}');
      scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 30, top: 20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Password',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                TextField(
                  obscureText: _obscureText,
                  controller: _currentPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Enter Current password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        )),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'New Password',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Enter New password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        )),
                  ),
                  obscureText: _obscureText,
                ),
                SizedBox(height: 16),
                Text(
                  'Confirm new password',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                TextField(
                  obscureText: _obscureText,
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Re-type new password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        )),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Colors.blue,
                      // decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _changePassword();
                    },
                    child: Text(
                      'Change password',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF5EED5), // Background color
    );
  }
}
