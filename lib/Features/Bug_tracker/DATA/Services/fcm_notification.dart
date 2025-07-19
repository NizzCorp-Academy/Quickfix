import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// ------------------------------
/// FcmNotificationService - Firebase Cloud Messaging Handler
/// ------------------------------
///
/// Purpose:
/// Handles Firebase Cloud Messaging (FCM) for push notifications in the app.
/// - Requests user permission
/// - Displays notifications when app is in foreground
/// - Handles notification clicks
/// - Provides device token for push notification sending
///
/// Usage:
/// - Call [registerPushNotificationHandler()] during app initialization.
/// - Use [getDeviceToken()] to retrieve the current device's FCM token.
/// ----------------------------------------------------------------------------
class FcmNotificationService {
  /// Instance of Firebase Messaging.
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  /// Local Notifications Plugin to show foreground notifications
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
   /// --------------------------------------------------------------------
  /// Registers push notification handlers and permissions.
  /// - Requests user permission to receive notifications.
  /// - Initializes local notification settings.
  /// - Listens for foreground and background notification events.


  Future<void> registerPushNotificationHandler() async {
       // Request notification permission from user.
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
     // Allow displaying notifications when app is in foreground.
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Define notification channel for Android.
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );
      // Initialize local notifications.
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@drawable/ic_launcher',
    );
    //var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response){
        onSelectNotification(response.toString());
      },
    );
    
    // Listen for foreground messages.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint(
          "\nForground message notification: ${message.notification?.title} "
              "${message.notification?.body}");
      debugPrint("Forground message data: ${message.data.toString()}");

      RemoteNotification? notification = message.notification;

      if (notification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });
    
    // Handle notification tap when app is opened from background.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("Message Clicked: ${message.data.toString()}");
    });
    debugPrint("Notification Service Registered");
  }
   /// Called when the user taps on a local notification.
  ///
  /// Parses the [data] payload and logs it.
  void onSelectNotification(String? data) {
    debugPrint("Local Message Clicked: $data");
    if (data?.isNotEmpty ?? false) {
      Map<String, dynamic> payload = jsonDecode(data!);
      debugPrint("Local Message Clicked: $payload");
    }
  }
    /// Retrieves the device's unique Firebase Messaging Token.
  /// Can be used to send push notifications to this device.
  Future<String> getDeviceToken() async {
    String token = await messaging.getToken() ?? "";
    debugPrint('FirebaseToken: $token');
    return token;
  }
}