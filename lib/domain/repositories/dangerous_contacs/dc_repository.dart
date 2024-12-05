import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';


abstract class DCRepository {
  Future<List<ContactEntity>?> getDCList({required String currentUserId});

  Future<void> addToDC(
      {required String currentUserId, required dynamic dc});

  Future<void> deleteFromDC(
      {required String currentUserId, required String dctId});
}
