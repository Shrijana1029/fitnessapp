import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fitnessapp/screens/foods/controller.dart';
import 'package:fitnessapp/screens/front_page.dart';
import 'package:fitnessapp/screens/profile/set_goals.dart';

// import 'package:fitnessapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  //connecting project with firebase
  Get.lazyPut(() => FavoritesController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic',
      channelName: 'fitness notification',
      channelDescription: 'Notification Channel for fitness app',
      playSound: true,
    )
  ]);
  // Check if user has granted notification permission globally
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  // Listen to notification taps/actions globally
  // AwesomeNotifications().actionStream.listen((receivedNotification) {
  //   print('Notification tapped: ${receivedNotification.payload}');
  //   // Navigate or perform actions based on notification
  // });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldKey,
        title: 'Flutter Demo',
        home: const FrontPage(),
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
