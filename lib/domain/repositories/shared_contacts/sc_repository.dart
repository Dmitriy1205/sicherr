import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

abstract class SCRepository {
  Future<List<ContactEntity>?> getSCList();

  Future<ContactEntity?> addTag({
    required String contactId,
    required String tagName,
  });

  Future<void> rateContact({
    required String contactId,
    required String rate,
    required String currentUserPhoneNumber,
  });

  Future<int> getAllUsersLength();
}
