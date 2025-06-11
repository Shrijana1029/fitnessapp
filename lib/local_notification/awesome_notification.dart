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

  static void sendRepeatingNotification() async {
    try {
      print("Attempting to schedule repeating notification...");

      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: createUniqueId(), // Unique ID for each schedule
          channelKey: 'scheduled_channel',
          title: 'Water Intake Reminder',
          body: 'Remember to drink 300ml of water!',
          notificationLayout: NotificationLayout.Default,
        ),
        schedule: NotificationInterval(
          interval:
              (const Duration(minutes: 60)), // Interval in seconds (2 hours)
          timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
          repeats: true,
          allowWhileIdle: true,
        ),
      );

      print("Scheduled repeating notification every 2 hours.");
    } catch (e) {
      print("Error scheduling repeating notification: $e");
    }
  }

  static Future<void> cancelAllNotifications() async {
    try {
      print("Cancelling all notifications...");
      await AwesomeNotifications().cancelAll();
      print("All notifications cancelled.");
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<void> cancelScheduledNotifications() async {
    try {
      print("Cancelling scheduled notifications...");
      await AwesomeNotifications().cancelAllSchedules();
      print("Scheduled notifications cancelled.");
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<void> cancelNotificationById(int id) async {
    try {
      print("Cancelling notification ID $id...");
      await AwesomeNotifications().cancel(id);
      print("Notification $id cancelled.");
    } catch (e) {
      print("Error: $e");
    }
  }
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(5);
}
