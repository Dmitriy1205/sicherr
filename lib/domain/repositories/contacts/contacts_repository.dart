import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

abstract class ContactsRepository {
  Future<void> setUpdateContacts(
      {required String currentUserId,
      required List<ContactEntity> sharedContacts});
  Stream<List<ContactEntity>?> getSharedContactsStream({required String currentUserId});
  Future<List<ContactEntity>?> getSharedContacts({required String currentUserId});
  Future<List<ContactEntity>> getLocalContacts();
}
