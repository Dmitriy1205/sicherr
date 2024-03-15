
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

  Future<void> initializeLocalNotifications() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@drawable/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await localNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(NotificationResponse response) async {
    final RegExp regExp = RegExp(r'(?<=type:\s)(\w+)|(?<=link:\s)(\S+)');
    final Iterable<Match> matches = regExp.allMatches(response.payload ?? '');

    String? type;
    String? link;

    for (Match match in matches) {
      if (match.group(1) != null) {
        type = match.group(1);
      } else if (match.group(2) != null) {
        link = match.group(2);
      }
    }

    if (type == 'sos') {
      if (link != null) {
        final googleMapsLink = _extractGoogleMapsLink(message: link);
        if (googleMapsLink == null) return;
        final uri = Uri.parse(googleMapsLink);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      }
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
      iOS: DarwinNotificationDetails(presentSound: true));

  Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await localNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data.toString(),
      );
    });
  }

  String? _extractGoogleMapsLink({required String message}) {
    RegExp regExp = RegExp(r'https:\/\/www\.google\.com\/maps\?q=[0-9\.,&=]+');
    final match = regExp.firstMatch(message);
    if (match != null) {
      return match.group(0);
    }
    return null;
  }
}
