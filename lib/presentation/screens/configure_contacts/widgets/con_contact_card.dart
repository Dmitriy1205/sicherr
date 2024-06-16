import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/configure_contacts/configure_contacts_bloc.dart';
import 'package:sicherr/presentation/widgets/selectable_contact_card.dart';

class ConContactCard extends StatelessWidget {
  const ConContactCard(
      {super.key, required this.contact, this.isSelected = false});
  final ContactEntity contact;
  final bool isSelected;


  @override
  Widget build(BuildContext context) {
    return SelectableContactCard(
      canBeSelected: true,
      contact: contact,
      isSelected: isSelected,
      onTap: () {
        context
            .read<ConfigureContactsBloc>()
            .add(ConfigureContactsEvent.selectContact(contact));
      },
    );
  }
}
