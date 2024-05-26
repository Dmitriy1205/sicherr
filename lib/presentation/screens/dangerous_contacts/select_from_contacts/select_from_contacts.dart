import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/danger_contact/dc_bloc.dart';
import 'package:sicherr/presentation/bloc/pick_dc/pick_dc_cubit.dart';
import 'package:sicherr/presentation/screens/dangerous_contacts/select_from_contacts/select_contacts_screen.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/localization_utils.dart';
import '../../../bloc/shared_contacts/sc_bloc.dart';
import '../../../widgets/app_dropdown_picker.dart';

class SelectFromContactsScreen extends StatefulWidget {
  final List<ContactEntity> dangerousContacts;

  const SelectFromContactsScreen({
    super.key,
    required this.dangerousContacts,
  });

  @override
  State<SelectFromContactsScreen> createState() =>
      _SelectFromContactsScreenState();
}

class _SelectFromContactsScreenState extends State<SelectFromContactsScreen> {
  String? pickedValue;
  @override
  void initState() {
    context.read<ScBloc>().add(const ScEvent.getAllSC());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DcBloc, DcState>(
      listener: (context, state) {
        state.maybeMap(
            loaded: (_) {
              context.read<ScBloc>().add(const ScEvent.getAllSC());
              context.read<PickDcCubit>().reset();
              return Navigator.pop(context);
            },
            orElse: () {});
      },
      child: Scaffold(
        appBar: DefaultAppBar(
          title: AppLocalizations.of(context)!.selectFromContacts,
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
                      AppLocalizations.of(context)!.selectFromContacts,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 18, color: AppColors.mainAccent),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SelectContactsScreen(
                            dangerousContacts: widget.dangerousContacts,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(17),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE1E1E1)),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppIcons.addressBook),
                                const SizedBox(
                                  width: 15,
                                ),
                                context.watch<PickDcCubit>().state.contacts !=
                                            null &&
                                        context
                                            .watch<PickDcCubit>()
                                            .state
                                            .contacts!
                                            .isNotEmpty
                                    ? Text(
                                        '${context.watch<PickDcCubit>().state.contacts!.length} ${AppLocalizations.of(context)!.contactsSelected}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      )
                                    : Text(
                                        AppLocalizations.of(context)!.select,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                              ],
                            ),
                            const FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
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
                          pickedValue = v;
                        });
                      },
                      items: LocalizationUtils(context: context)
                          .localizedDangerousTags()),
                ],
              ),
              Positioned(
                bottom: 55,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    AppElevatedButton(
                      text: AppLocalizations.of(context)!.add,
                      widget: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text(AppLocalizations.of(context)!.add),
                      ),
                      onPressed: context.watch<PickDcCubit>().state.contacts !=
                                  null &&
                              context
                                  .watch<PickDcCubit>()
                                  .state
                                  .contacts!
                                  .isNotEmpty &&
                              pickedValue != null
                          ? () {
                              List<ContactEntity> contactList =
                                  context.read<PickDcCubit>().state.contacts!;

                              List<ContactEntity> updatedContacts =
                                  contactList.map((contact) {
                                return ContactEntity(
                                  id: sl<PhoneNumberEncryptor>()
                                      .decrypt(contact.id),
                                  name: '',
                                  phoneNumber: sl<PhoneNumberEncryptor>()
                                      .decrypt(contact.phoneNumber),
                                  tags: [pickedValue!],
                                );
                              }).toList();

                              context.read<DcBloc>().add(DcEvent.addToDC(
                                  dangerContact: updatedContacts));

                            }
                          : null,
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
}
