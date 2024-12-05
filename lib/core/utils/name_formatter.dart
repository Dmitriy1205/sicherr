import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NameFormatter {
  static String formatName({
    required BuildContext context,
    required String name,
  }) {
    name = name.trim();

    if (name.isEmpty) {
      return AppLocalizations.of(context)!.suspiciousContact;
    }

    List<String> parts = name.split(' ');

    if (parts.length > 2) {
      String firstName = parts.first;
      String lastName = parts.last;
      return '${_formatPart(firstName)} ${_formatPart(lastName)}';
    } else if (parts.length == 2) {
      String firstName = parts[0];
      String lastName = parts[1];
      return '${_formatPart(firstName)} ${_formatPart(lastName)}';
    } else if (parts.length == 1 && parts[0].isNotEmpty) {
      String singleName = parts[0];
      return _formatPart(singleName);
    } else {
      return AppLocalizations.of(context)!.suspiciousContact;
    }
  }

  static String _formatPart(String part) {
    if (part.length <= 1) return part;
    return part[0] + '*' * (part.length - 1);
  }
}
