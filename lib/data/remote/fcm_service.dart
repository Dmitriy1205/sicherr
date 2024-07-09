
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:url_launcher/url_launcher.dart';


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

  Future<void> initializeLocalNotifications(void Function(NotificationResponse) onDidReceiveNotificationResponse) async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@drawable/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await localNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future<void> showNotification({required String title, required String body, Duration? delay}) async {
    if(delay == null){
      await localNotificationsPlugin.show(
        0, // Notification ID
        title,
        body,
        platformChannelSpecifics,
        //payload: 'Custom_Sound',
      );
    }else{
      final location = tz.getLocation('America/Detroit');
      tz.setLocalLocation(location);
      var nowAmerica = tz.TZDateTime.now(location).add(delay);
      await localNotificationsPlugin.zonedSchedule(0, title, body, nowAmerica, NotificationDetails(), uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
    }
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
      iOS: DarwinNotificationDetails(presentSound: true, sound: 'syren.wav'));

  Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await localNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: jsonEncode(message.data),
      );
    });
  }
}
