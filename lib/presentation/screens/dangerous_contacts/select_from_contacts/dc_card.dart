import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/pick_dc/pick_dc_cubit.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';

class DCCard extends StatelessWidget {
  const DCCard({super.key, required this.contact});

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickDcCubit, PickDcState>(
      builder: (context, state) {
        return SelectableContactCard(
          contact: contact,
          isSelected: state.contacts.any((element) => element.id == contact.id),
          onTap: () {
            context.read<PickDcCubit>().pickAsDanger(
                pickedContact: contact,
                pickedAsDangerContacts: state.contacts ?? []);
          },
        );
      },
    );
  }
}
