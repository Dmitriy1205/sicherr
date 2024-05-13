import 'dart:io';

import 'package:flutter_callkit_voximplant/flutter_callkit_voximplant.dart';

class CallerIdService {
  final FCXPlugin _plugin = FCXPlugin();
  final FCXProvider _provider = FCXProvider();
  final FCXCallController _callController = FCXCallController();
  bool _configured = false;

  Future<void> initFCXProvider() async {
    if(Platform.isAndroid) return;
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

  Future<void> handleIncomingCallIdentification() async {
    if(Platform.isAndroid) return;
    try {
      await _plugin.getIdentifiablePhoneNumbers();
    } on FCXException catch (e) {
      print(e.message);
    } on FCXPluginError catch (e) {
      print(e.toString());
    }
  }
}
