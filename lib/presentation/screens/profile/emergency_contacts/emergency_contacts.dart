import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';
import 'package:sicherr/presentation/widgets/permission_alert_dialog.dart';
import 'package:sicherr/presentation/widgets/search_phone_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../../widgets/default_app_bar.dart';
import 'em_contact_card.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyContactsScreen> createState() =>
      _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  @override
  void initState() {
    context
        .read<EmergencyContactBloc>()
        .add(const EmergencyContactEvent.getAllEmContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.emergencyContacts,
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
                child: Text(
                  AppLocalizations.of(context)!.addEmergencyContacts,
                  style: AppTheme.themeData.textTheme.titleLarge,
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
            child: SearchPhoneField(
              hintText: AppLocalizations.of(context)!.search,
              onChanged: (text) {
                context
                    .read<EmergencyContactBloc>()
                    .add(const EmergencyContactEvent.getAllEmContacts());

                context.read<ContactsBloc>().add(ContactsEvent.searchContact(
                      text: text,
                    ));
              },
            ),
          ),
          const ContactListDisplayed(),
        ],
      ),
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        return state.maybeMap(
            loadInProgress: (_) => const Expanded(child: LoadingIndicator()),
            orElse: () => state.categorizedContacts!.isEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.noContacts,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          if (state.isPermissionDenied)
                            GestureDetector(
                              onTap: () => showPermissionAlertDialog(context,
                                  content: AppLocalizations.of(context)!
                                      .allowAccess, onClosed: (_) {
                                context
                                    .read<ContactsBloc>()
                                    .add(const ContactsEvent.checkPermission());
                              }),
                              child: SizedBox(
                                width: 300,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .givePermissionSynchronize,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      padding:
                          const EdgeInsets.only(left: 20, right: 32, top: 18),
                      itemCount: state.categorizedContacts!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String category =
                            state.categorizedContacts!.keys.elementAt(index);
                        List<ContactEntity> itemsInCategory =
                            state.categorizedContacts![category]!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: index != 0 ? 15 : 0, bottom: 5),
                              child: Text(
                                category,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: itemsInCategory.length,
                              itemBuilder: (BuildContext context, int index) {
                                final item = itemsInCategory[index];
                                bool isEmergency = context
                                            .read<EmergencyContactBloc>()
                                            .state
                                            .emContacts ==
                                        null
                                    ? false
                                    : context
                                        .read<EmergencyContactBloc>()
                                        .state
                                        .emContacts!
                                        .any(
                                            (element) => element.id == item.id);
                                return EmContactCard(
                                  contact: item,
                                  isEmergency: isEmergency,
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ));
      },
    );
  }
}
