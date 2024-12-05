import '../../entities/contact_entity/contact_entity.dart';

abstract class CallerIdRepository {
  Future<void> updateIdentifiedContacts(
      {required List<ContactEntity> sharedContacts});
}
