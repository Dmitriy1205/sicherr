import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCMService {
  final FirebaseMessaging? messaging;

  FCMService({
    required this.messaging,
  });

  Future<void> initializeFirebase() async {
    await messaging!.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<String?> getToken() async {
    String? token = await messaging!.getToken();
    return token;
  }

  final FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeLocalNotifications() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@drawable/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await localNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  NotificationDetails platformChannelSpecifics = const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        priority: Priority.high,
        importance: Importance.max,
        playSound: true,
        icon: "@drawable/ic_launcher",
      ),
      iOS: DarwinNotificationDetails(presentSound: true));

  Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await localNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data['type'],
      );
    });
  }
}
