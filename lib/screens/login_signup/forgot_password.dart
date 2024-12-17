import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        title: Text(
          'Forgott password',
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor:
            Theme.of(context).primaryColorDark, // Teal app bar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40), // Spacing from the top
              Icon(
                Icons.lock_outline,
                size: 100,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'Forgot password?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Enter your email below to reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 42),
              TextField(
                decoration: InputDecoration(
                  hintText: ' Enter your email address',
                  border: UnderlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit logic
                  },
                  child: Text(
                    'Send Verification',
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
    );
  }
}
