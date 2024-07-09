import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/utils/phone_encryptor.dart';
import 'sc_repository.dart';

class SCRepositoryImpl extends SCRepository {
  final FirebaseFirestore _firestore;
  final String collection = 'shared_contacts';
  final PhoneNumberEncryptor _encryptor;

  SCRepositoryImpl({
    required FirebaseFirestore firestore,
    required PhoneNumberEncryptor encryptor,
  })  : _firestore = firestore,
        _encryptor = encryptor;

  @override
  Future<ContactEntity?> addTag(
      {required String contactId, required String tagName}) async {
    try {
      final docRef = _firestore.collection(collection).doc(contactId);
      final docSnapshot =
          await _firestore.collection(collection).doc(contactId).get();

      final existingTags = List<String>.from(docSnapshot.data()?['tags'] ?? []);
      final newTags = [...existingTags, tagName];

      await docRef.update({'tags': newTags});
      final updatedDocSnapshot = await docRef.get();
      if (updatedDocSnapshot.data() != null) {
        return ContactEntity.fromJsonDecrypted(updatedDocSnapshot.data()!, _encryptor.decrypt);
      }
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<List<ContactEntity>?> getSCList() async {
    try {
      final querySnapshot = await _firestore.collection(collection).get();

      List<ContactEntity> scList = querySnapshot.docs.map((doc) {
        final data = doc.data();
        ContactEntity contact = ContactEntity.fromJsonDecrypted(data, _encryptor.decrypt);

        ///decryption of every contact
        // String decryptedPhoneNumber = _encryptor.decrypt(contact.phoneNumber);
        // String decryptedId = _encryptor.decrypt(contact.id);

        // return contact.copyWith(phoneNumber: decryptedPhoneNumber,id: decryptedId);
        return contact;
      }).toList();

      return scList;
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<void> rateContact({
    required String contactId,
    required String rate,
    required String currentUserPhoneNumber,
  }) async {
    try {
     final encryptedUserPhoneNumber = _encryptor.encrypt(currentUserPhoneNumber);
      final docRefSharedContacts =
          _firestore.collection(collection).doc(contactId);

      final sharedDocSnapshot = await docRefSharedContacts.get();

      if (sharedDocSnapshot.exists) {
        final List existingRatings = sharedDocSnapshot.data()?['ratings'] ?? [];

        final alreadyRated = existingRatings
            .any((element) => element['fromUserId'] == encryptedUserPhoneNumber);
        print('already rated $alreadyRated');

        if (alreadyRated) {
          existingRatings.removeWhere(
              (element) => element['fromUserId'] == encryptedUserPhoneNumber);
        } else {
          existingRatings
              .add({"fromUserId": encryptedUserPhoneNumber, "rating": rate});
        }

        await docRefSharedContacts.update({'ratings': existingRatings});
      }
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<int> getAllUsersLength() async {
    try {
      final querySnapshot = await _firestore.collection('users').get();

      return querySnapshot.size;
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }
}
