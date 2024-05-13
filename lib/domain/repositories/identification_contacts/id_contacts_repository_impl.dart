import 'dart:io';

import 'package:sicherr/data/local/caller_identifications_service.dart';
import 'package:sicherr/domain/repositories/identification_contacts/id_contacts_repository.dart';

import '../../../data/local/latest_contact_prefs.dart';
import '../../entities/contact_entity/contact_entity.dart';

class CallerIdRepositoryImpl extends CallerIdRepository {
  final CallerIdService _callerIdService;
  final LatestContactPrefs _latestContactPrefs;

  CallerIdRepositoryImpl(
      {required CallerIdService callerIdService,
      required LatestContactPrefs latestContactPrefs})
      : _callerIdService = callerIdService,
        _latestContactPrefs = latestContactPrefs;

  @override
  Future<void> updateIdentifiedContacts(
      {required List<ContactEntity> sharedContacts}) async {
    if(Platform.isAndroid) return;
    List<ContactEntity> contactsToAdd = [];

    ///getting the list of createAt from contacts
    final List<DateTime> createdAtList =
        sharedContacts.map((contact) => contact.createdAt!).toList();

    ///getting the latest createdAt date
    final DateTime latestCreatedAt = createdAtList
        .reduce((value, element) => value.isAfter(element) ? value : element);

    ///date when the last time identified contacts was updated
    final DateTime? latestUpdateDate =
        await _latestContactPrefs.getLastCreatedAt();

    if (latestUpdateDate == null) {
      contactsToAdd = sharedContacts
          .where((contact) => (contact.rating ?? 0) < 3.5)
          .toList();
      await _latestContactPrefs.setLastCreatedAt(latestCreatedAt);
      await _callerIdService.addSharedNumbers(contacts: contactsToAdd);
    } else if (latestUpdateDate.isBefore(latestCreatedAt)) {
      contactsToAdd = sharedContacts
          .where((contact) =>
              contact.createdAt!.isAfter(latestUpdateDate) &&
              (contact.rating ?? 0) < 3.5)
          .toList();
      await _latestContactPrefs.setLastCreatedAt(latestCreatedAt);
      await _callerIdService.addSharedNumbers(contacts: contactsToAdd);
    }
  }
}
