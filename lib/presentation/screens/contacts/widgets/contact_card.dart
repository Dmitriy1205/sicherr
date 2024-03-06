import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/contact_detail.dart';
import 'package:sicherr/presentation/widgets/round_sos_icon.dart';
import 'package:sicherr/presentation/widgets/round_wrapper_icon.dart';

class ContactCard extends StatefulWidget {
  const ContactCard({super.key, required this.contact});

  final ContactEntity contact;

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
   bool? isEmergency;

  @override
  void initState() {
    isEmergency = context.read<EmergencyContactBloc>().state.emContacts == null
        ? false
        : context
        .read<EmergencyContactBloc>()
        .state
        .emContacts!
        .any((element) => element.id == widget.contact.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<EmergencyContactBloc, EmergencyContactState>(
  listener: (context, state) {
    state.maybeMap(
        loaded: (_){
          setState(() {
            isEmergency = context
                .read<EmergencyContactBloc>()
                .state
                .emContacts!
                .any((element) => element.id == widget.contact.id);
          });
        },
        orElse: (){});
  },
  child: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetailScreen(
                contact: widget.contact,
              ),
            ));
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            ClipOval(
              child: widget.contact.image != null && widget.contact.image!.isNotEmpty
                  ? Image.memory(
                      widget.contact.image!,
                      height: 42,
                      width: 42,
                    )
                  : Image.asset(
                      AppImages.userPlaceholder,
                      height: 42,
                      width: 42,
                    ),
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Wrap(
                spacing: 10,
                children: [
                  Text(
                    widget.contact.name.isNotEmpty
                        ? widget.contact.name
                        : widget.contact.getMainPhoneNumber,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),

                  isEmergency == null || !isEmergency! ? const SizedBox()
                    :  const RoundSosIcon(height: 20, width: 20, fontSize: 6.11,),
                ],
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () {
                ContactsManager.launchCall(
                    phoneNumber: widget.contact.getMainPhoneNumber);
              },
              child: const RoundWrapperIcon(svgPath: AppIcons.phone),
            ),
          ],
        ),
      ),
    ),
);
  }
}
