import 'package:fitnessapp/screens/breakfast_page.dart';
import 'package:fitnessapp/screens/food_details.dart';
import 'package:fitnessapp/screens/front_page.dart';
import 'package:fitnessapp/screens/home.dart';
import 'package:fitnessapp/screens/login_signup/change_password.dart';
import 'package:fitnessapp/screens/login_signup/forgot_password.dart';
import 'package:fitnessapp/screens/login_signup/login_page.dart';
import 'package:fitnessapp/screens/manage_profle.dart';
import 'package:fitnessapp/screens/profile.dart';
// import 'package:fitnessapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  //connecting project with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldKey,
        title: 'Flutter Demo',
        home: LoginPage(),
        theme: ThemeData(
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
            ),
            titleLarge: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              // letterSpacing: 1.0,
              color: Color.fromARGB(255, 32, 30, 30),
            ),
            displaySmall: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              // letterSpacing: 1.0,
              color: Color.fromARGB(255, 32, 30, 30),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, primary: Colors.black),
          // primary: const Color.fromARGB(255, 252, 227, 138)),
          primaryColorDark:
              const Color.fromARGB(255, 184, 216, 201), //soft green color,
          primaryColorLight: const Color.fromARGB(255, 237, 234, 215),

          useMaterial3: true,
        ));
  }
}
