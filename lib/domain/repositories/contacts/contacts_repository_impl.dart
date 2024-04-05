import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final FirebaseFirestore _firestore;
  final String collectionName = 'users';
  final String subCollectionName = 'contacts';

  ContactsRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Stream<List<ContactEntity>?> getSharedContactsStream(
      {required String currentUserId}) {
    return _firestore
        .collection(collectionName)
        .doc(currentUserId)
        .collection(subCollectionName)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ContactEntity.fromJson(data);
      }).toList();
    });
  }

  @override
  Future<List<ContactEntity>?> getSharedContacts(
      {required String currentUserId}) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(collectionName)
          .doc(currentUserId)
          .collection(subCollectionName)
          .get();

      List<ContactEntity> contacts = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ContactEntity.fromJson(data);
      }).toList();

      return contacts;
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  @override
  Future<void> setUpdateContacts(
      {required String currentUserId,
      required List<ContactEntity> sharedContacts}) async {
    try {
      final batch = _firestore.batch();
      await _deleteUnusedContacts(currentUserId,
          sharedContacts: sharedContacts);

      for (var contact in sharedContacts) {
        // Reference to the document for each contact
        DocumentReference docRef = _firestore
            .collection(collectionName)
            .doc(currentUserId)
            .collection(subCollectionName)
            .doc(contact.id);

        // Set the data for each document in the batch
        batch.set(docRef, contact.toJson());
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw BadRequestException(message: e.message!);
    }
  }

  Future<void> _deleteUnusedContacts(String currentUserId,
      {required List<ContactEntity> sharedContacts}) async {
    final batch = _firestore.batch(); // Initialize a batch
    final collectionReference = await _firestore
        .collection(collectionName)
        .doc(currentUserId)
        .collection(subCollectionName)
        .get();
    for (var document in collectionReference.docs) {
      if (sharedContacts.none((e) => e.id == document.id)) {
        batch.delete(document.reference);
      }
    }
    await batch.commit();
  }

  @override
  Future<List<ContactEntity>> getLocalContacts() async {
    final List<ContactEntity> contacts = [];

    final permission = await Permission.contacts.request();
    if (permission.isGranted) {
      final localContacts = await ContactsService.getContacts();

      for (var element in localContacts) {
        final contact = ContactEntity.fromLocalContact(element);
        if (contact.phones.isNotEmpty) {
          contacts.add(contact);
        }
      }
    } else if (permission.isPermanentlyDenied) {
      log('Contacts Permission Denied');
    }

    return contacts;
  }
}
