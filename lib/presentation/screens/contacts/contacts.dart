import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/contact_detail.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../bloc/shared_contacts/sc_bloc.dart';
import '../configure_contacts/configure_contacts_screen.dart';

class ContactsScreen extends StatefulWidget {
  final String? contactName;

  const ContactsScreen({Key? key, this.contactName}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late TextEditingController _searchTextController ;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController(text: widget.contactName);
    context
        .read<EmergencyContactBloc>()
        .add(const EmergencyContactEvent.getAllEmContacts());
    context.read<ScBloc>().add(const ScEvent.getAllSC());
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.contacts,
        showBackButton: true,
        icon: _AddContactsBnt(),
      ),
      body: BlocConsumer<ContactsBloc, ContactsState>(
        listener: (BuildContext context, ContactsState state) {
          state.maybeMap(
              notFoundContact: (_) {
                AppToast.showError(
                    context, AppLocalizations.of(context)!.noContacts);
              },
              openFoundedContact: (state) {
                _searchTextController.text = '';
                context
                    .read<ContactsBloc>()
                    .add(const ContactsEvent.searchContact(''));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContactDetailScreen(contact: state.contact)),
                );
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeMap(
              loadInProgress: (_) => const Center(child: LoadingIndicator()),
              orElse: () => const Center(child: LoadingIndicator()),
              loaded: (state) => Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 18),
                        child: SearchPhoneField(
                          controller: _searchTextController,
                          hintText: AppLocalizations.of(context)!.search,
                          onChanged: (text) {
                            context.read<EmergencyContactBloc>().add(
                                const EmergencyContactEvent.getAllEmContacts());

                            context
                                .read<ContactsBloc>()
                                .add(ContactsEvent.searchContact(text));
                          },
                        ),
                      ),
                      ContactListDisplayed(
                        groupedContacts: state.categorizedContacts,
                        searchingNumber: _searchTextController.text,
                      )
                    ],
                  ));
        },
      ),
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed({
    Key? key,
    required this.groupedContacts,
    required this.searchingNumber,
  }) : super(key: key);
  final Map<String, List<ContactEntity>> groupedContacts;
  final String searchingNumber;

  @override
  Widget build(BuildContext context) {
    return groupedContacts.isEmpty
        ? Expanded(
            child: GestureDetector(
              onTap: () {
                context
                    .read<ContactsBloc>()
                    .add(ContactsEvent.searchSharedContact(searchingNumber));
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.searchForContact,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      searchingNumber,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : GroupedItems(
            groupedContacts: groupedContacts,
            contactFactory: ContactCardFactory(),
          );
  }
}

class _AddContactsBnt extends StatelessWidget {
  const _AddContactsBnt();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_rounded, size: 30),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ConfigureContactsScreen()));
      },
      padding: const EdgeInsets.all(15),
      color: Theme.of(context).primaryColor,
    );
  }
}