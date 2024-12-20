import 'package:fitnessapp/screens/home.dart';
import 'package:fitnessapp/screens/login_signup/login_page.dart';
import 'package:fitnessapp/screens/login_signup/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/firebase_services/firebase_auth.dart';
import 'package:fitnessapp/main.dart';

// import 'package:instagram_clone/data/firebase_service/firebase_auth.dart';
// import 'package:instagram_clone/screens/login_page.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final _email = TextEditingController();
  final _usernamecontroller = TextEditingController();
  final _biocontroller = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final _password = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  late final String inner;
  late final bool say;
  late String displayMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 234, 215),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),

            Image.asset(
              'assets/img/logo1.png',
              width: 1000,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            //for circle avatar

            const SizedBox(
              height: 40,
            ),
            _buildfield(_email, Icons.email, 'Email', false),
            const SizedBox(
              height: 10,
            ),
            _buildfield(_usernamecontroller, Icons.man, 'Username', false),
            const SizedBox(
              height: 10,
            ),

            _buildfield(_password, Icons.lock, 'Password', true),
            const SizedBox(
              height: 10,
            ),
            _buildfield(_confirmpasswordcontroller, Icons.lock_outline,
                'Confirm Password', true),
            const SizedBox(
              height: 10,
            ),
            ////shrijana
            /// const Text("Legal first name"),
            _buildfield(
                _firstname, Icons.lock_outline, 'Enter First Name', false),
            const SizedBox(height: 15),
            // Last Name
            const Text("Legal last name"),
            const SizedBox(height: 5),
            _buildfield(
                _lastname, Icons.lock_outline, 'Enter Last Name', false),
            const SizedBox(height: 15),
            // Date of Birth
            const Text("Date of Birth"),
            const SizedBox(height: 5),
            _buildfield(_dob, Icons.lock_outline, 'Enter ', false),
            const SizedBox(height: 15),
            const Text("Phone Number"),
            const SizedBox(height: 5),
            _buildfield(_phone, Icons.lock_outline, 'Enter ', false),
            const SizedBox(height: 15),
            // age
            const Text("Your Age"),
            const SizedBox(height: 5),
            _buildfield(_age, Icons.lock_outline, 'Enter age', false),
            const SizedBox(height: 15),
            //height
            const Text("Your Height"),
            const SizedBox(height: 5),
            _buildfield(_height, Icons.lock_outline, 'Enter height', false),
            const SizedBox(height: 15),
            //weight
            const Text("Your weight"),
            const SizedBox(height: 5),
            _buildfield(_weight, Icons.lock_outline, 'Enter weight', false),
            const SizedBox(height: 15),

            //######################SIGN UP BUTTON
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, // Full-width button
                child: ElevatedButton(
                  onPressed: () async {
                    final message = await _auth.registration(
                      firstName: _firstname.text,
                      lastName: _lastname.text,
                      phone: _phone.text.trim(),
                      age: _age.text.trim(),
                      height: _height.text,
                      weight: _weight.text,
                      email: _email.text,
                      password: _password.text,
                    );
                    if (message!.contains('Success')) {
                      navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) => const Home()));
                    } else {
                      if (message.contains('Password is too weak')) {
                        displayMessage = 'Password is too weak';
                      } else if (message.contains(
                          'The account already exists for this email')) {
                        displayMessage = 'Account already exists';
                      } else {
                        displayMessage = message;
                      }
                    }
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(displayMessage)));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text('Sign me Up',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Already have an Account?',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Text('LogIn',
                        style: Theme.of(context).textTheme.displaySmall),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildfield(
      TextEditingController controller, IconData icon, String inner, bool say) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: say,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey[600],
          ),
          hintText: inner,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
