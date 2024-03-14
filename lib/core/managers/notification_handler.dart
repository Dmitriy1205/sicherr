import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class NotificationHandlerInterface {
  Future<void> handleNotification();
}

final class NotificationHandler implements NotificationHandlerInterface {
  final FirebaseMessaging _messaging;

  NotificationHandler({required FirebaseMessaging messaging})
      : _messaging = messaging;

  @override
  Future<void> handleNotification() async {
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage == null) return;
    final body = initialMessage.notification!.body!;
    final googleMapsLink = _extractGoogleMapsLink(body);
    if (googleMapsLink == null) return;
    final uri = Uri.parse(googleMapsLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  String? _extractGoogleMapsLink(String message) {
    RegExp regExp = RegExp(r'https:\/\/www\.google\.com\/maps\?q=[0-9\.,&=]+');
    final match = regExp.firstMatch(message);
    if (match != null) {
      return match.group(0);
    }
    return null;
  }
}
