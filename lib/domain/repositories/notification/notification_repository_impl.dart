import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicherr/data/remote/client.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../data/remote/fcm_service.dart';

const String _notificationsEnabledKey = 'notifications_enabled';

class NotificationRepositoryImpl extends NotificationRepository {
  final FCMService _fcmService;
  final FirebaseFirestore _firebaseFirestore;
  final HttpClient _client;
  final SharedPreferences _sharedPreferences;
  final String collectionName = 'users';
  final String subCollectionName = 'fcm_tokens';
  final String subCollectionNotificationsName = 'notifications';

  NotificationRepositoryImpl({
    required FCMService fcmService,
    required FirebaseFirestore firebaseFirestore,
    required HttpClient client,
    required SharedPreferences sharedPreferences,
  })  : _client = client,
        _sharedPreferences = sharedPreferences,
        _fcmService = fcmService,
        _firebaseFirestore = firebaseFirestore;

  @override
  Stream<List<Map<String, dynamic>>> userNotifications(
      {required String currentUserId}) {
    return _firebaseFirestore
        .collection(collectionName)
        .doc(currentUserId)
        .collection(subCollectionNotificationsName)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> sendNotification(
      {required String title,
      required String message,
      required List<String> phones,
      required Map<String, dynamic> data}) {
    return _client.sendNotification(
        title: title, message: message, phones: phones, data: data);
  }

  @override
  bool isNotificationsEnabled() =>
      _sharedPreferences.getBool(_notificationsEnabledKey) ?? true;

  @override
  Future<void> setNotificationsEnabled({required bool value}) =>
      _sharedPreferences.setBool(_notificationsEnabledKey, value);

  //If notifications are disabled, we want to delete token instead of saving it
  @override
  Future<void> addToken({required String currentUserId}) async{
    try {
      final token = await _fcmService.getToken();
      await _firebaseFirestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc('0')
          .set({
        'token': token,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message.toString());
    }
  }

  @override
  Future<void> deleteToken({required String currentUserId}) async{
    try {
      await _firebaseFirestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc('0')
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e.code.toString());
    }
  }
}
