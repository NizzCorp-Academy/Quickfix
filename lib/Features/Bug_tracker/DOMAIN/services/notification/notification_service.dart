import 'package:bug_tracker_application/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static Future<void> showNotification(String tittle, String desc) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          'channel_id',
          'channel_name',
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      tittle,
      desc,
      platformChannelSpecifics,
    );
  }

  // void Notification(){
  //   // Logic to send a notification
  //   print("Notification sent");
  // }

  // void showNotification(String s, String t) {}

  // // List<Notification> _notifications = [];

  // // void sendNotification(String message) {
  // //   final notification = Notification(
  // //     tittle: DateTime.now().millisecondsSinceEpoch.toString(),
  // //     message: message,
  // //     date: DateTime.now(),
  // //   );
  // //   _notifications.add(notification);
  // // }

  // // List<Notification> getAllNotifications() {
  // //   return _notifications;
  // // }
}
