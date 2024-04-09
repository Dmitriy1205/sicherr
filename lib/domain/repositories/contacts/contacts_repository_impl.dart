import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final FirebaseFirestore _firestore;
  final usersCollectionName = 'users';
  final contactsSubCollectionName = 'contacts';

  ContactsRepositoryImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Stream<List<ContactEntity>?> getSharedContactsStream(
      {required String currentUserId}) {
    return _firestore
        .collection(usersCollectionName)
        .doc(currentUserId)
        .collection(contactsSubCollectionName)
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
          .collection(usersCollectionName)
          .doc(currentUserId)
          .collection(contactsSubCollectionName)
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
  Future<void> setUpdateContacts({
    required String currentUserId,
    required List<ContactEntity> sharedContacts,
  }) async {
    try {
      final batch = _firestore.batch();
      await _deleteUnusedContacts(currentUserId,
          sharedContacts: sharedContacts);

      for (var contact in sharedContacts) {
        // Reference to the user selected contacts document
        final docRefUserContacts = _firestore
            .collection(usersCollectionName)
            .doc(currentUserId)
            .collection(contactsSubCollectionName)
            .doc(contact.id);

        //Shared contacts
        final docRefSharedContacts =
            _firestore.collection(contactsSubCollectionName).doc(contact.id);

        // Check if the document already exists
        final sharedDocSnapshot = await docRefSharedContacts.get();
        if (sharedDocSnapshot.exists) {
          // Document already exists, update the "tags" field
          final existingTags =
              List<String>.from(sharedDocSnapshot.data()?['tags'] ?? []);
          final newTags = [
            ...existingTags,
            contact.name
          ]; // Combine existing and new tags
          batch.update(docRefSharedContacts, {'tags': newTags});
        } else {
          // Document does not exist, set the data for the new document
          batch.set(docRefSharedContacts, contact.toJson());
        }

        // Set the data for each document in the batch
        batch.set(docRefUserContacts, contact.toJsonSimplified());
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
        .collection(usersCollectionName)
        .doc(currentUserId)
        .collection(contactsSubCollectionName)
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
        try {
          final contact = ContactEntity.fromLocalContact(element);
          if (contact.phoneNumber.isNotEmpty) {
            contacts.add(contact);
          }
        } catch (_) {}
      }
    } else if (permission.isPermanentlyDenied) {
      log('Contacts Permission Denied');
    }

    return contacts;
  }

  @override
  Future<ContactEntity?> searchInSharedContacts(String number) async {
    if (number.isEmpty) {
      return null;
    }

    final sharedContactsSnap =
        await _firestore.collection(contactsSubCollectionName).get();

    final query1 = number;
    final Set queries = {query1};
    final dialCodeDetails = ContactsManager.separateDialCode(number);

    if (dialCodeDetails != null) {
      final query2 = number.replaceAll(RegExp(r"\D"), "");
      final query3 = '+$query2';
      final query4 = query2.substring(dialCodeDetails.phone.length - 1);

      queries.addAll([query2, query3, query4]);
    } else {
      final userPhoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;
      final dialCodeDetails =
          ContactsManager.separateDialCode(userPhoneNumber ?? '');
      if (dialCodeDetails != null) {
        final query2 = ContactsManager.combineDialCodeAndPhone(
            countryCode: dialCodeDetails, phone: number);
        final query3 = '+$query2';
        queries.addAll([query2, query3]);
      }
    }

    final contactSnapshot = sharedContactsSnap.docs.firstWhereOrNull((element) {
      if (queries.contains(element.id)) {
        return true;
      }
      return false;
    });
    final data = contactSnapshot?.data();
    final contact = data != null ? ContactEntity.fromJson(data) : null;
    return contact;
  }
}
