import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../../bloc/pick_dc/pick_dc_cubit.dart';

class SelectContactsScreen extends StatefulWidget {
  final List<ContactEntity> dangerousContacts;

  const SelectContactsScreen({
    Key? key,
    required this.dangerousContacts,
  }) : super(key: key);

  @override
  State<SelectContactsScreen> createState() => _SelectContactsScreenState();
}

class _SelectContactsScreenState extends State<SelectContactsScreen> {
  @override
  void initState() {
    context
        .read<EmergencyContactBloc>()
        .add(const EmergencyContactEvent.getAllEmContacts());
    context.read<PickDcCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.selectContactsScreen,
        icon: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: context.watch<PickDcCubit>().state.contacts.isEmpty
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(AppIcons.done),
                  )),
        ),
      ),
      body: BlocBuilder<PickDcCubit, PickDcState>(
        builder: (context, state) {
          return state.maybeMap(
              orElse: () => const Center(child: LoadingIndicator()),
              picked: (state) {
                return Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 18),
                          child: Text(
                            AppLocalizations.of(context)!
                                .selectContactsToDangerous,
                            style: AppTheme.themeData.textTheme.displayLarge!
                                .copyWith(color: AppColors.greyDark),
                          ),
                        )),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 18),
                      child: SearchPhoneField(
                        hintText: AppLocalizations.of(context)!.search,
                        onChanged: (text) {
                          context
                              .read<PickDcCubit>()
                              .search(text);
                        },
                      ),
                    ),
                    ContactListDisplayed(
                        groupedContacts: state.searchedContactsCategorized)
                  ],
                );
              });
        },
      ),
    );
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed({Key? key, required this.groupedContacts})
      : super(key: key);
  final Map<String, List<ContactEntity>> groupedContacts;

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
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        : GroupedItems(
            groupedContacts: groupedContacts,
            contactFactory: DCCardFactory(),
          );
  }
}
