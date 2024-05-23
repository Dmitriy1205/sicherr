import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/utils/localization_utils.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/widgets/app_checkbox.dart';
import 'package:sicherr/presentation/widgets/app_dropdown_picker.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:sicherr/presentation/widgets/country_code_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/const/colors.dart';
import '../../../bloc/danger_contact/dc_bloc.dart';
import '../../../bloc/shared_contacts/sc_bloc.dart';

class AddDCScreen extends StatefulWidget {
  const AddDCScreen({super.key});

  @override
  State<AddDCScreen> createState() => _AddDCScreenState();
}

class _AddDCScreenState extends State<AddDCScreen> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  bool isNameUnknown = false;
  String phoneNumber = '';
  String tag = '';

  @override
  Widget build(BuildContext context) {
    return BlocListener<DcBloc, DcState>(
  listener: (context, state) {
    state.maybeMap(
        loaded: (_) {
          context.read<ScBloc>().add(ScEvent.getAllSC());
          return Navigator.pop(context);
        },
        orElse: () {});
  },
  child: Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.addNumber,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    AppLocalizations.of(context)!.enterTheNumber,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18, color: AppColors.mainAccent),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CountryCodeField(
                  onChanged: (value) {
                    setState(() {
                      phoneNumber = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 29,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      AppCheckbox(
                          value: isNameUnknown,
                          onChanged: (v) {
                            setState(() {
                              isNameUnknown = v!;
                            });
                          },
                          borderColor: AppColors.lightGrey),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        AppLocalizations.of(context)!.nameIsUnknown,
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                isNameUnknown
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              AppLocalizations.of(context)!.enterTheFirstName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 18,
                                      color: AppColors.mainAccent),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: nameController,
                            focusNode: _nameFocusNode,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.firstName,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                            onTapOutside: (v) {
                              _nameFocusNode.unfocus();
                            },
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              AppLocalizations.of(context)!.enterTheLastName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 18,
                                      color: AppColors.mainAccent),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: lastNameController,
                            focusNode: _lastNameFocusNode,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.lastName,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                            ),
                            onTapOutside: (v) {
                              _lastNameFocusNode.unfocus();
                            },
                          ),
                          const SizedBox(
                            height: 29,
                          ),
                        ],
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    AppLocalizations.of(context)!.chooseTag,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 18, color: AppColors.mainAccent),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppDropdownPicker(
                  onChange: (v) {
                    setState(() {
                      tag = v;
                    });
                  },
                  items: LocalizationUtils(context: context)
                      .localizedDangerousTags(),
                ),
              ],
            ),
            Positioned(
              bottom: 55,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  AppElevatedButton(
                    text: 'Add',
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Text(AppLocalizations.of(context)!.add),
                    ),
                    onPressed: phoneNumber.isEmpty || tag.isEmpty
                        ? null
                        : () {
                            context.read<DcBloc>().add(
                                  DcEvent.addToDC(
                                    dangerContact: ContactEntity(
                                      id: phoneNumber,
                                      name:
                                          '${nameController.text} ${lastNameController.text} ',
                                      phoneNumber: phoneNumber,
                                      tags: [tag],
                                    ),
                                  ),
                                );


                          },
                    width: 0,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.white),
                    borderRadius: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
);
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    _nameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    super.dispose();
  }
}
