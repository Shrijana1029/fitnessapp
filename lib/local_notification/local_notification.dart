// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotification {
//   static final FlutterLocalNotificationsPlugin
//       _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static Future init() async {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     const DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings();
//     const LinuxInitializationSettings initializationSettingsLinux =
//         LinuxInitializationSettings(defaultActionName: 'Open notification');
//     const WindowsInitializationSettings initializationSettingsWindows =
//         WindowsInitializationSettings(
//             appName: 'Flutter Local Notifications Example',
//             appUserModelId: 'Com.Dexterous.FlutterLocalNotificationsExample',
//             // Search online for GUID generators to make your own
//             guid: 'd49b0314-ee7a-4626-bf79-97cdb8a991bb');
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             macOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux,
//             windows: initializationSettingsWindows);
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: (details) {});
//   }

//   static Future showsimplenotification({
//     required String title,
//     required String body,
//     required String payload,
//   }) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails('your channel id', 'your channel name',
//             channelDescription: 'your channel description',
//             importance: Importance.max,
//             priority: Priority.high,
//             ticker: 'ticker');
//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await _flutterLocalNotificationsPlugin
//         .show(0, title, body, notificationDetails, payload: payload);
//   }
// }
