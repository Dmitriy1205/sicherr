import 'package:flutter/widgets.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/screens/configure_contacts/widgets/con_contact_card.dart';
import 'package:sicherr/presentation/screens/contacts/widgets/contact_card.dart';
import 'package:sicherr/presentation/screens/profile/emergency_contacts/em_contact_card.dart';

import '../../screens/dangerous_contacts/select_from_contacts/dc_card.dart';

// Factory pattern for creating dynamic UI with grouped items
// If you wanna use GropedItems widget, add here new factory for your custom items
abstract class BaseContactFactory {
  Widget create(ContactEntity contact);
}

class ContactCardFactory implements BaseContactFactory {
  @override
  Widget create(ContactEntity contact) {
    return ContactCard(contact: contact);
  }
}

class EmContactCardFactory implements BaseContactFactory {
  @override
  Widget create(ContactEntity contact) {
    return EmContactCard(contact: contact);
  }
}

class DCCardFactory implements BaseContactFactory {
  @override
  Widget create(ContactEntity contact) {
    return DCCard(contact: contact);
  }
}

class SelectableContactCardFactory implements BaseContactFactory {
  List<ContactEntity> selectedContacts;
  final PhoneNumberEncryptor en = PhoneNumberEncryptor();

  SelectableContactCardFactory({this.selectedContacts = const []});

  @override
  Widget create(ContactEntity contact) {
    return ConContactCard(
      contact: contact,
      isSelected: selectedContacts.any((e) => en.decrypt(e.id) == contact.id),
    );
  }
}
