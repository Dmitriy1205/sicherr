import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/entities/onboarding/onboarding.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../entities/user_profile/user_profile.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _firestore;
  final String collectionName = 'users';
  final String subCollectionName = 'onboarding';

  UserRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Stream<UserProfile?> getUserFieldsStream({required String currentUserId}) {
    return _firestore
        .collection(collectionName)
        .doc(currentUserId)
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists) {
        return null;
      }
      final data = snapshot.data();
      return UserProfile.fromJson(data ?? {});
    });
  }

  @override
  Future<void> setUserFields({
    required String currentUserId,
    required String phoneNumber,
  }) async {
    try {
      await _firestore.collection(collectionName).doc(currentUserId).set(
          UserProfile(
            enabledSosQB: false,
            sosMessage: '',
            sendSosGeolocation: false,
            alarmToneQB: false,
            id: currentUserId,
            phone: phoneNumber,
            createdAt: DateTime.now().toString(),
          ).toJson(),
          SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<void> updateUserFields({
    required String currentUserId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .update(data);
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<Onboarding?> getOnboarding({required String currentUserId}) async {
    try {
      final data = await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc('0')
          .get();
      if (!data.exists) {
        return null;
      }
      return Onboarding.fromJson(data.data() ?? {});
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<void> writeOnboarding({required String currentUserId}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc('0')
          .set(const Onboarding(isWelcome: true).toJson(),
              SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<void> updateOnboarding(
      {required String currentUserId,
      required Map<String, dynamic> data}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc('0')
          .update(data);
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }
}
