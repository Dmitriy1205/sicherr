import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository_impl.dart';
import 'package:sicherr/presentation/bloc/configure_contacts/configure_contacts_bloc.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigureContactsScreen extends StatelessWidget {
  const ConfigureContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfigureContactsBloc(ContactsRepositoryImpl(
        firestore: FirebaseFirestore.instance,
      )),
      child: Scaffold(
        appBar: DefaultAppBar(
          title: AppLocalizations.of(context)!.configureContacts,
          showBackButton: true,
          icon: const DoneBtn(),
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
                          AppLocalizations.of(context)!.selectContacts,
                          style: AppTheme.themeData.textTheme.titleLarge,
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

class DoneBtn extends StatelessWidget {
  const DoneBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfigureContactsBloc, ConfigureContactsState>(
      listener: (context, state) => state.whenOrNull(
        assignedContacts: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const InitialScreen(
              initPage: PrimaryPageEnum.contacts,
            ),
          ),
        ),
      ),
      builder: (context, state) => state.maybeMap(
        loadInProgress: (_) => const SizedBox.shrink(),
        orElse: () => const SizedBox.shrink(),
        loaded: (state) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: state.selectedContacts.isNotEmpty
              ? () {
                  context
                      .read<ConfigureContactsBloc>()
                      .add(const ConfigureContactsEvent.assignContacts());
                }
              : null,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 20),
            child: Text(
              String.fromCharCode(Icons.done.codePoint),
              style: TextStyle(
                inherit: false,
                color: state.selectedContacts.isNotEmpty
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.3),
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                fontFamily: Icons.done.fontFamily,
                package: Icons.done.fontPackage,
              ),
            ),
          ),
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
            contactFactory: SelectableContactCardFactory(
              selectedContacts: selectedContacts,
            ),
          );
  }
}
