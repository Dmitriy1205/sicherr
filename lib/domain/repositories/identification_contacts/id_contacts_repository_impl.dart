
import 'dart:ui';

import 'package:sicherr/core/const/strings.dart';

import 'dart:io';


import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/data/local/caller_identifications_service.dart';
import 'package:sicherr/domain/repositories/identification_contacts/id_contacts_repository.dart';

import '../../../core/utils/phone_encryptor.dart';
import '../../../data/local/latest_contact_prefs.dart';
import '../../entities/contact_entity/contact_entity.dart';

class CallerIdRepositoryImpl extends CallerIdRepository {
  final CallerIdService _callerIdService;
  final LatestContactPrefs _latestContactPrefs;
  final PhoneNumberEncryptor _encryptor;

  CallerIdRepositoryImpl({
    required CallerIdService callerIdService,
    required LatestContactPrefs latestContactPrefs,
    required PhoneNumberEncryptor encryptor,
  })  : _callerIdService = callerIdService,
        _latestContactPrefs = latestContactPrefs,
        _encryptor = encryptor;

  @override
  Future<void> updateIdentifiedContacts(
      {required List<ContactEntity> sharedContacts}) async {
    try {
      if(Platform.isAndroid) return;
      List<ContactEntity> contactsToAdd = [];

      ///getting the list of createAt from contacts
      final List<DateTime> createdAtList =
          sharedContacts.map((contact) => contact.createdAt!).toList();

      ///getting the latest createdAt date
      if (createdAtList.isNotEmpty) {
        final DateTime latestCreatedAt = createdAtList.reduce(
            (value, element) => value.isAfter(element) ? value : element);

        ///date when the last time identified contacts was updated
        final DateTime? latestUpdateDate =
            await _latestContactPrefs.getLastCreatedAt();

        ///default name for identified contact on de & en language
        final modifiedSharedContacts = sharedContacts
            .map((element) => element.copyWith(
                name: PlatformDispatcher.instance.locale.languageCode == 'de'
                    ? AppStrings.warningDe
                    : AppStrings.warningEn,
                phoneNumber: element.phoneNumber))
            .toList();

        if (latestUpdateDate == null) {
          contactsToAdd = sharedContacts
              .where((contact) => (contact.rating ?? 0) < 3.5)
              .toList();
          await _latestContactPrefs.setLastCreatedAt(latestCreatedAt);
          await _callerIdService.addSharedNumbers(
              contacts: modifiedSharedContacts);
        } else {
          contactsToAdd = sharedContacts
              .where((contact) => (contact.rating ?? 0) < 3.5)
              .toList();
          await _latestContactPrefs.setLastCreatedAt(latestCreatedAt);
          await _callerIdService.addSharedNumbers(
              contacts: modifiedSharedContacts);
        }
      }
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }
}
