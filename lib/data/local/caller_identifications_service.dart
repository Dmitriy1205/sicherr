import 'package:flutter_callkit_voximplant/flutter_callkit_voximplant.dart';

import '../../domain/entities/contact_entity/contact_entity.dart';

class CallerIdService {
  final FCXPlugin _plugin = FCXPlugin();
  final FCXProvider _provider = FCXProvider();
  final FCXCallController _callController = FCXCallController();
  bool _configured = false;

  Future<void> initFCXProvider() async {
    if (_configured) {
      return;
    }

    try {
      await _callController.configure();
      await _provider.configure(FCXProviderConfiguration(
        'FlutterCallKit',
        includesCallsInRecents: true,
        supportsVideo: false,
        maximumCallsPerCallGroup: 1,
        supportedHandleTypes: {
          FCXHandleType.PhoneNumber,
          FCXHandleType.Generic
        },
      ));
      _configured = true;
    } on FCXException catch (e) {
      print(e.message);
    }
  }

  Future<void> addSharedNumbers({required List<ContactEntity> contacts}) async {
    List<FCXIdentifiablePhoneNumber> identifiableContacts = [];
    for (var contact in contacts) {
      String formattedPhoneNumber = contact.phoneNumber.replaceAll('+', '');
      var phone = FCXIdentifiablePhoneNumber(
        int.parse(formattedPhoneNumber),
        label: contact.name,
      );
      identifiableContacts.add(phone);
    }
    try {
      await _plugin.addIdentifiablePhoneNumbers(identifiableContacts);
    } on FCXException catch (e) {
      print(e.message);
      throw Exception(e.message);
    } on FCXPluginError catch (e) {
      print(e.toString());
      throw Exception(e);

    }
  }
}
