import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/entities/onboarding/onboarding.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/utils/phone_encryptor.dart';
import '../../entities/user_profile/user_profile.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseFirestore _firestore;
  final String collectionName = 'users';
  final String subCollectionName = 'onboarding';
  final PhoneNumberEncryptor _encryptor;

  UserRepositoryImpl({
    required FirebaseFirestore firestore,
    required PhoneNumberEncryptor encryptor,
  })  : _firestore = firestore,
        _encryptor = encryptor;

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
      final encryptedPhoneNumber = _encryptor.encrypt(phoneNumber);
      await _firestore.collection(collectionName).doc(currentUserId).set(
          UserProfile(
            enabledSosQB: false,
            sosMessage: '',
            sendSosGeolocation: false,
            alarmToneQB: false,
            id: currentUserId,
            phone: encryptedPhoneNumber,
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

  @override
  Future<bool> collectionExists(String userId, String collectionName) async {
    try {
      final collectionRef = await _firestore
          .collection(this.collectionName)
          .doc(userId)
          .collection(collectionName)
          .get();

      return collectionRef.docs.isNotEmpty;
    } catch (e) {
      // Handle any errors, such as permission denied or network issues
      return false;
    }
  }
}
