import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../entities/emergency_contact/emergency_contact.dart';
import 'em_contacts_repository.dart';

class EmContactsRepositoryImpl extends EmContactsRepository {
  final FirebaseFirestore _firestore;
  final String collectionName = 'users';
  final String subCollectionName = 'emergency';

  EmContactsRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> setEmContact({
    required String currentUserId,
    required EmergencyContact emContact,
  }) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc(emContact.id)
          .set(emContact.toJson());
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<void> deleteEmContact(
      {required String currentUserId, required String emContactId}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc(emContactId)
          .delete();
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Stream<List<EmergencyContact>?> getEmContactList(
      {required String currentUserId}) {
    return _firestore
        .collection(collectionName)
        .doc(currentUserId)
        .collection(subCollectionName)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return EmergencyContact.fromJson(data);
      }).toList();
    });
  }
}
