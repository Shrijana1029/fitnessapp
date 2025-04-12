import 'package:awesome_notifications/awesome_notifications.dart';

class AwesomeNotification {
  static Future<void> sendNotification() async {
    try {
      print("Attempting to send notification...");
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'basic_channel',
          title: 'Water Intake Reminder',
          body: 'Remember to drink 300ml of water!',
        ),
      );
      print("Notification sent successfully");
    } catch (e) {
      print("Error sending notification: $e");
    }
  }

  static void sendScheduledNotification() async {
    try {
      print("Attempting to send scheduled notification...");

      DateTime scheduleTime =
          DateTime.now().add(const Duration(seconds: 30)); // Add 1 minute

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: createUniqueId(), // Ensure unique ID
          channelKey: 'scheduled_channel',
          title: 'Water Intake Reminder',
          body: 'Remember to drink 300ml of water!',
          notificationLayout: NotificationLayout.Default,
        ),
        schedule: NotificationCalendar(
          year: scheduleTime.year,
          month: scheduleTime.month,
          day: scheduleTime.day,
          hour: scheduleTime.hour,
          minute: scheduleTime.minute,
          second: scheduleTime.second,
          preciseAlarm: true, // Ensures accuracy
          allowWhileIdle: true, // Works in Doze Mode
        ),
      );

      print("Scheduled notification successfully at: $scheduleTime");
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(5);
}
