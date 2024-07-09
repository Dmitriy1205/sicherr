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
import '../../../core/utils/phone_encryptor.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final FirebaseFirestore _firestore;
  final usersCollectionName = 'users';
  final sharedCollectionName = 'shared_contacts';
  final contactsSubCollectionName = 'contacts';
  final PhoneNumberEncryptor _encryptor;

  ContactsRepositoryImpl({
    required FirebaseFirestore firestore,
    required PhoneNumberEncryptor encryptor,
  })  : _firestore = firestore,
        _encryptor = encryptor;

  @override
  Stream<List<ContactEntity>?> getUserContactsStream(
      {required String currentUserId}) {
    return _firestore
        .collection(usersCollectionName)
        .doc(currentUserId)
        .collection(contactsSubCollectionName)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        return ContactEntity.fromJsonDecrypted(data, _encryptor.decrypt);
      }).toList();
    });
  }

  @override
  Future<List<ContactEntity>?> getUserContacts(
      {required String currentUserId}) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection(usersCollectionName)
          .doc(currentUserId)
          .collection(contactsSubCollectionName)
          .get();

      List<ContactEntity> contacts = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ContactEntity.fromJsonDecrypted(data, _encryptor.decrypt);
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
        final encryptedPhoneNumber = _encryptor.encrypt(contact.phoneNumber);

        contact = contact.copyWith(
            phoneNumber: encryptedPhoneNumber, id: encryptedPhoneNumber);
        // Reference to the user selected contacts documents
        DocumentReference docRefUserContacts = _firestore
            .collection(usersCollectionName)
            .doc(currentUserId)
            .collection(contactsSubCollectionName)
            .doc(contact.id);



        //Shared contacts
        // final docRefSharedContacts = _getSharedContactDocRef(contact.id);
        //
        // Check if the documents already exists
        // final sharedDocSnapshot = await docRefSharedContacts.get();
        // if (sharedDocSnapshot.exists) {
        //   // Document already exists, update the "tags" field
        //   final existingTags =
        //       List<String>.from(sharedDocSnapshot.data()?['tags'] ?? []);
        //   if (!existingTags.contains(contact.name)) {
        //     final newTags = [
        //       ...existingTags,
        //       contact.name
        //     ]; // Combine existing and new tags
        //
        //     batch.update(docRefSharedContacts, {'tags': newTags});
        //   }
        // } else {
        //   // Document does not exist, set the data for the new documents
        //   batch.set(docRefSharedContacts, contact.toJson());
        // }

        // Set the data for each documents in the batch
        batch.set(docRefUserContacts, contact.toJson());
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

    ///TODO: REFACTOR, NOT EFFICIENT
    final sharedContactsSnap =
        await _firestore.collection(sharedCollectionName).get();

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
      if (queries.contains(_encryptor.decrypt(element.id))) {
        return true;
      }
      return false;
    });
    final data = contactSnapshot?.data();
    final contact = data != null ? ContactEntity.fromJsonDecrypted(data, _encryptor.decrypt) : null;
    return contact;
  }

  @override
  Future<ContactEntity?> addNewContactTag({
    required String contactId,
    required String tag,
  }) async {
    try {
      //Shared contacts
      final docRefSharedContacts = _getSharedContactDocRef(contactId);

      // Check if the documents already exists
      final sharedDocSnapshot = await docRefSharedContacts.get();
      if (sharedDocSnapshot.exists) {
        // Document already exists, update the "tags" field
        final existingTags =
            List<String>.from(sharedDocSnapshot.data()?['tags'] ?? []);
        final newTags = [...existingTags, tag]; // Combine existing and new tags
        await docRefSharedContacts.update({'tags': newTags});
        final updatedData = await docRefSharedContacts.get();
        if (updatedData.data() != null) {
          return ContactEntity.fromJsonDecrypted(updatedData.data()!, _encryptor.decrypt);
        }
      }
    } catch (e) {
      log('addNewContactTag error');
      return null;
    }
    return null;
  }

  DocumentReference<Map<String, dynamic>> _getSharedContactDocRef(
      String contactId) {
    final result = _firestore.collection(sharedCollectionName).doc(contactId);
    return result;
  }

  @override
  Future<ContactEntity?> getSharedContact(String id) async {
    FirebaseAuth.instance.currentUser!.uid;
    final docRefSharedContact = await _getSharedContactDocRef(id).get();
    final docRefUserContact =
        await _firestore.collection(sharedCollectionName).doc(id).get();
    final sharedContactJson = docRefSharedContact.data();
    final userContactJson = docRefUserContact.data();
    if (sharedContactJson != null || userContactJson != null) {
      return ContactEntity.combineContactsInfo(
          userContactJson: userContactJson ?? {},
          sharedContactJson: sharedContactJson ?? {},
          decryption: _encryptor.decrypt);
    } else {
      return null;
    }
  }

  @override
  Future<ContactEntity?> rateContact({
    required String contactId,
    required double rate,
  }) async {
    // try {
    //   //Shared contacts
    //   final docRefSharedContacts = _getSharedContactDocRef(contactId);
    //
    //   final sharedDocSnapshot = await docRefSharedContacts.get();
    //   if (sharedDocSnapshot.exists) {
    //     final List existingRatings =
    //         (sharedDocSnapshot.data()?['ratings'] ?? []);
    //     final alreadyRated = existingRatings.any((element) =>
    //         element['fromUserId'] ==
    //         FirebaseAuth.instance.currentUser!.phoneNumber);
    //
    //     if (alreadyRated) {
    //       existingRatings.removeWhere((element) =>
    //           element['fromUserId'] ==
    //           FirebaseAuth.instance.currentUser!.phoneNumber);
    //     }
    //
    //     final newRatings = [
    //       ...existingRatings,
    //       {
    //         "fromUserId": FirebaseAuth.instance.currentUser!.phoneNumber,
    //         "rating": rate
    //       }
    //     ];
    //
    //     final newRate = ContactsManager.calculateContactRate(
    //         newRatings.map((e) => Rating.fromJson(e)).toList());
    //
    //     await docRefSharedContacts
    //         .update({'ratings': newRatings, 'rating': newRate});
    //     final updatedData = await docRefSharedContacts.get();
    //     if (updatedData.data() != null) {
    //       return ContactEntity.fromJson(updatedData.data()!);
    //     }
    //   }
    // } catch (e) {
    //   log('rateContact error');
    //   return null;
    // }
    // return null;
  }

  @override
  Future<List<ContactEntity>> getAllSharedContacts() async {
    try {
      final collectionReference =
          await _firestore.collection('shared_contacts').get();
      final List<ContactEntity> sharedContacts = collectionReference.docs
          .map((doc) => ContactEntity.fromJsonDecrypted(doc.data(), _encryptor.decrypt))
          .toList();
      return sharedContacts;
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }
}
