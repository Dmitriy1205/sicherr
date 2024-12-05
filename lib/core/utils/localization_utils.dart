import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationUtils {
  final BuildContext context;

  LocalizationUtils({required this.context});

  List<String> localizedDangerousTags() {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return [
      appLocalizations.inappropriateBehavior,
      appLocalizations.harassment,
      appLocalizations.stalking,
      appLocalizations.theft,
      appLocalizations.insults,
      appLocalizations.didNotShowUp,
      appLocalizations.physicalViolence,
      appLocalizations.psychologicalViolence,
      appLocalizations.becameNegativelyNoticeable,
      appLocalizations.attack,
      appLocalizations.intimidation,
      appLocalizations.cyberbullying,
      appLocalizations.discrimination,
      appLocalizations.safetyConcerns,
      appLocalizations.threat,
      appLocalizations.abuse,
      appLocalizations.touchedInappropriately,
      appLocalizations.fakeCall,
      appLocalizations.swindler,
      appLocalizations.notPaid,
      appLocalizations.exploitation,
    ];
  }
}
