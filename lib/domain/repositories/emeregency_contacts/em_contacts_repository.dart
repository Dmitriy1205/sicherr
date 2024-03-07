
import '../../entities/emergency_contact/emergency_contact.dart';

abstract class EmContactsRepository {
  Stream<List<EmergencyContact>?> getEmContactList(
      {required String currentUserId});

  Future<void> setEmContact(
      {required String currentUserId, required EmergencyContact emContact});

  Future<void> deleteEmContact(
      {required String currentUserId, required String emContactId});
}
