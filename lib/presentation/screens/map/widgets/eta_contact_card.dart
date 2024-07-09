import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/map/home_position/home_position_cubit.dart';
import 'package:sicherr/presentation/bloc/pick_dc/pick_dc_cubit.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';

class EtaContactCard extends StatelessWidget {
  const EtaContactCard({super.key, required this.contact});

  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePositionCubit, HomePositionState>(
      builder: (context, state) {
        return SelectableContactCard(
          canBeSelected: true,
          contact: contact,
          isSelected: state.routeDetails.etaContacts.isNotEmpty
              ? state.routeDetails.etaContacts
                  .any((element) => element.phoneNumber == contact.phoneNumber)
              : false,
          onTap: () {
            state.routeDetails.etaContacts.isNotEmpty
                ? context.read<HomePositionCubit>().setEtaContact(
                    routeDetails:
                        context.read<HomePositionCubit>().state.routeDetails,
                    etaContact: null)
                : context.read<HomePositionCubit>().setEtaContact(
                    routeDetails:
                        context.read<HomePositionCubit>().state.routeDetails,
                    etaContact: contact);
          },
        );
      },
    );
  }
}
