import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

abstract class ContactsRepository {
  Future<void> setUpdateContacts(
      {required String currentUserId,
      required List<ContactEntity> sharedContacts});
  Stream<List<ContactEntity>?> getUserContactsStream(
      {required String currentUserId});
  Future<List<ContactEntity>?> getUserContacts({required String currentUserId});
  Future<List<ContactEntity>> getLocalContacts();
  Future<ContactEntity?> searchInSharedContacts(String number);
  Future<ContactEntity?> getSharedContact(String id);
  Future<ContactEntity?> addNewContactTag({
    required String contactId,
    required String tag,
  });
}
