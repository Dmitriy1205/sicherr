import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirebaseExceptionLocalizer {
  static String localize(BuildContext context,
      { String? exceptionCode,required String exceptionMessage}) {
    switch (exceptionCode) {
      case 'expired-action-code':
        return AppLocalizations.of(context)!.expiredActionCode;
      case 'invalid-action-code':
        return AppLocalizations.of(context)!.invalidActionCode;
      case 'invalid-verification-code':
        return AppLocalizations.of(context)!.multifactorVerification;
      case 'timeout':
        return AppLocalizations.of(context)!.timeout;
      case 'too-many-requests':
        return AppLocalizations.of(context)!.tooManyRequests;
      case 'web-context-cancelled':
        return AppLocalizations.of(context)!.userCancelled;

      default:
        return exceptionMessage;
    }
  }
}
