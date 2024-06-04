import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

import '../../../core/exceptions/exceptions.dart';
import 'dc_repository.dart';

class DCRepositoryImpl extends DCRepository {
  final FirebaseFirestore _firestore;
  final String usersCollection = 'users';
  final String sharedConCollection = 'shared_contacts';
  final String subCollectionName = 'dangerous_contacts';
  final PhoneNumberEncryptor _encryptor;

  DCRepositoryImpl({
    required FirebaseFirestore firestore,
    required PhoneNumberEncryptor encryptor,
  })  : _firestore = firestore,
        _encryptor = encryptor;

  @override
  Future<void> addToDC({
    required String currentUserId,
    required dynamic dc,
  }) async {
    try {


      ///Adding contact to dangerous_contacts sub collection
      if (dc is ContactEntity) {
        String encryptedPhoneNumber = _encryptor.encrypt(dc.phoneNumber);
        String encryptedId = _encryptor.encrypt(dc.id);
        dc = dc.copyWith(phoneNumber: encryptedPhoneNumber, id: encryptedId);

        QuerySnapshot allDangerous = await _firestore
            .collection(usersCollection)
            .doc(currentUserId)
            .collection(subCollectionName)
            .get();

        bool documentExists = allDangerous.docs.any((doc) => doc.id == dc.id);
        if (documentExists) {

          await _firestore
              .collection(usersCollection)
              .doc(currentUserId)
              .collection(subCollectionName)
              .doc(dc.id)
              .update({
            'phoneNumber': dc.phoneNumber,
            'id': dc.id,
            'tags': FieldValue.arrayUnion(dc.tags),
            'ratings': FieldValue.arrayUnion(dc.ratings),
          });
        } else {
          await _firestore
              .collection(usersCollection)
              .doc(currentUserId)
              .collection(subCollectionName)
              .doc(dc.id)
              .set(dc.toJson(),SetOptions(merge: true));
        }
      } else if (dc is List<ContactEntity>) {
        WriteBatch batch = _firestore.batch();

        for (ContactEntity contact in dc) {
          ///encryption of every contact
          String encryptedPhoneNumber = _encryptor.encrypt(contact.phoneNumber);
          String encryptedId = _encryptor.encrypt(contact.id);
          contact = contact.copyWith(
              phoneNumber: encryptedPhoneNumber, id: encryptedId);

          DocumentReference docRef = _firestore
              .collection(usersCollection)
              .doc(currentUserId)
              .collection(subCollectionName)
              .doc(contact.id);

          batch.set(docRef, contact.toJson());
        }

        await batch.commit();
      }

      ///Adding contact to shared_contacts collection
      if (dc is ContactEntity) {
        QuerySnapshot allShared =
        await _firestore.collection(sharedConCollection).get();
        bool documentExists = allShared.docs.any((doc) => doc.id == dc.id);
        if(documentExists){
          await _firestore
              .collection(sharedConCollection)
              .doc(dc.id)
              .update({
            'phoneNumber': dc.phoneNumber,
            'id': dc.id,
            'tags': FieldValue.arrayUnion(dc.tags),
            'ratings': FieldValue.arrayUnion(dc.ratings),
          });
        }else{
          await _firestore
              .collection(sharedConCollection)
              .doc(dc.id)
              .set(dc.toJson(), SetOptions(merge: true));
        }
      } else if (dc is List<ContactEntity>) {
        WriteBatch batch = _firestore.batch();

        for (ContactEntity contact in dc) {
          ///encryption of every contact
          String encryptedPhoneNumber = _encryptor.encrypt(contact.phoneNumber);
          String encryptedId = _encryptor.encrypt(contact.id);
          contact = contact.copyWith(
              phoneNumber: encryptedPhoneNumber, id: encryptedId);

          DocumentReference docRef =
              _firestore.collection(sharedConCollection).doc(contact.id);

          batch.set(docRef, contact.toJson());
        }

        await batch.commit();
      }
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<void> deleteFromDC(
      {required String currentUserId, required String dctId}) async {
    try {
      ///Delete contact from dangerous_contacts collection
      await _firestore
          .collection(usersCollection)
          .doc(currentUserId)
          .collection(subCollectionName)
          .doc(dctId)
          .delete();

      ///Delete contact from shared_contacts collection
      await _firestore.collection(sharedConCollection).doc(dctId).delete();
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  @override
  Future<List<ContactEntity>?> getDCList(
      {required String currentUserId}) async {
    try {
      final querySnapshot = await _firestore
          .collection(usersCollection)
          .doc(currentUserId)
          .collection(subCollectionName)
          .get();

      List<ContactEntity> dcList = querySnapshot.docs.map((doc) {
        final data = doc.data();

        ContactEntity contact = ContactEntity.fromJson(data, _encryptor.decrypt);
        return contact;
      }).toList();

      return dcList;
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }
}
