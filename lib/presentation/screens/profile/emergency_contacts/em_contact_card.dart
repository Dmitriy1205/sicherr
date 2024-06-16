import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/entities/emergency_contact/emergency_contact.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';

class EmContactCard extends StatelessWidget {
  const EmContactCard({super.key, required this.contact});

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
      builder: (context, state) {
        return SelectableContactCard(
          canBeSelected: true,
          contact: contact,
          isSelected:
              state.emContacts.any((element) => element.id == contact.id),
          onTap: () {
            state.emContacts.any((element) => element.id == contact.id)
                ? context.read<EmergencyContactBloc>().add(
                    EmergencyContactEvent.deleteFromEmContact(
                        contactId: contact.id))
                : context.read<EmergencyContactBloc>().add(
                      EmergencyContactEvent.addToEmContact(
                        emContact: EmergencyContact(
                            id: contact.id,
                            name: contact.name,
                            phoneNumber: contact.phoneNumber),
                      ),
                    );
          },
        );
      },
    );
  }
}
