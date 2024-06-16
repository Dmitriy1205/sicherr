import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository_impl.dart';
import 'package:sicherr/presentation/bloc/configure_contacts/configure_contacts_bloc.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/service_locator/service_locator.dart';

class ChooseEtaContactScreen extends StatelessWidget {
  const ChooseEtaContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfigureContactsBloc(
          ContactsRepositoryImpl(
            firestore: FirebaseFirestore.instance,
            encryptor: sl<PhoneNumberEncryptor>(),
          ),
          sl<PhoneNumberEncryptor>()),
      child: Scaffold(
        appBar: DefaultAppBar(
          title: AppLocalizations.of(context)!.chooseContacts,
          showBackButton: true,
        ),
        body: BlocBuilder<ConfigureContactsBloc, ConfigureContactsState>(
          builder: (context, state) {
            return state.maybeMap(
              loadInProgress: (_) => const Center(child: LoadingIndicator()),
              orElse: () => const Center(child: LoadingIndicator()),
              loaded: (state) => Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text(
                          AppLocalizations.of(context)!.chooseContactsDescription,
                          style: AppTheme.themeData.textTheme.displayLarge!
                              .copyWith(color: const Color(0xFF5B5B5B)),
                        ),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: SearchPhoneField(
                      hintText: AppLocalizations.of(context)!.search,
                      onChanged: (text) {
                        context
                            .read<ConfigureContactsBloc>()
                            .add(ConfigureContactsEvent.searchContact(text));
                      },
                    ),
                  ),
                  ContactListDisplayed(
                    groupedContacts: state.categorizedContacts,
                    isPermissionDenied: state.isPermissionDenied,
                    selectedContacts: state.selectedContacts,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed(
      {Key? key,
      required this.groupedContacts,
      required this.isPermissionDenied,
      required this.selectedContacts,
      required})
      : super(key: key);
  final Map<String, List<ContactEntity>> groupedContacts;
  final List<ContactEntity> selectedContacts;
  final bool isPermissionDenied;

  @override
  Widget build(BuildContext context) {
    return groupedContacts.isEmpty
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.noContacts,
                    style: const TextStyle(fontSize: 16),
                  ),
                  if (isPermissionDenied)
                    GestureDetector(
                      onTap: () => showPermissionAlertDialog(context,
                          content: AppLocalizations.of(context)!.allowAccess,
                          onClosed: (_) {
                        context.read<ConfigureContactsBloc>().add(
                            const ConfigureContactsEvent.checkPermission());
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
        : GroupedItems(
            groupedContacts: groupedContacts,
            contactFactory: EtaContactCardFactory(),
          );
  }
}
