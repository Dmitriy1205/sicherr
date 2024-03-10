import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../data/remote/fcm_service.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final FCMService _fcmService;
  final FirebaseFirestore _firebaseFirestore;
  final String collectionName = 'users';
  final String subCollectionName = 'fcm_tokens';

  NotificationRepositoryImpl({
    required FCMService fcmService,
    required FirebaseFirestore firebaseFirestore,
  })  : _fcmService = fcmService,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<void> saveToken({
    required String currentUserId,
  }) async {
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
  Future<void> removeToken({required String currentUserId}) async {
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
