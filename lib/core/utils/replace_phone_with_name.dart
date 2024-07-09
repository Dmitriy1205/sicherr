import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';

String replacePhoneWithName({required BuildContext context, required String input}){
  String result = input;
  final phoneNumbersList = _extractPhoneNumbers(result);
  Map<String,String> phoneNumbersAlternatives = {};
  for (var phoneNumber in phoneNumbersList) {
    final name = _findNameForPhone(context: context, phoneNumber: phoneNumber);
    if(name != null){
      phoneNumbersAlternatives[phoneNumber] = name;
    }
  }
  for(var phoneNumberAlternative in phoneNumbersAlternatives.keys){
    result = result.replaceAll(phoneNumberAlternative, phoneNumbersAlternatives[phoneNumberAlternative]!);
  }
  return result;
}

String? _findNameForPhone({required BuildContext context, required String phoneNumber}) {
  final allContacts = context.read<ContactsBloc>().state.maybeMap(
      loaded: (state) => state.categorizedContacts,
      orElse: () => <String,List<ContactEntity>>{});
  final matchingContact = allContacts.values.expand((e) => e).where((e) => e.phoneNumber == phoneNumber).firstOrNull;
  return matchingContact?.name;
}

List<String> _extractPhoneNumbers(String input) {
  final phoneRegExp = RegExp(
    r'\+?(\d{1,3})?[-.\s]?(\d{1,4})?[-.\s]?(\d{1,4})[-.\s]?(\d{1,9})',
    caseSensitive: false,
  );

  final matches = phoneRegExp.allMatches(input);

  return matches.map((match) => match.group(0)).whereNotNull().toList();
}
