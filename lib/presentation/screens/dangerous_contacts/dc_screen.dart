import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/utils/name_formatter.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/presentation/bloc/shared_contacts/sc_bloc.dart';
import 'package:sicherr/presentation/screens/dangerous_contacts/details_screen/dc_details_screen.dart';
import 'package:sicherr/presentation/screens/dangerous_contacts/select_from_contacts/select_from_contacts.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import '../../../core/const/images.dart';
import '../../../core/service_locator/service_locator.dart';
import '../../../core/theme/theme.dart';
import '../../bloc/danger_contact/dc_bloc.dart';
import '../../bloc/pick_dc/pick_dc_cubit.dart';
import '../../widgets/app_transparent_button.dart';
import 'add_dangerous/add_dc_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DCScreen extends StatefulWidget {
  DCScreen({super.key});

  @override
  State<DCScreen> createState() => _DCScreenState();
}

class _DCScreenState extends State<DCScreen> {
  @override
  void initState() {
    context.read<ScBloc>().add(const ScEvent.getAllSC());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DcBloc, DcState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              const SizedBox(
                height: 20,
              ),
              state.maybeMap(
                  loading: (_) => const Center(child: LoadingIndicator()),
                  orElse: () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.dc?.length ?? 0,
                      itemBuilder: (context, index) {
                        // final sharedCon = context
                        //     .read<ScBloc>()
                        //     .state
                        //     .sc!
                        //     .firstWhere((element) =>
                        // element.id == state.dc![index].id);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DCDetailScreen(
                                          contact: state.dc![index])));
                            },
                            splashColor: AppColors.white,
                            highlightColor: AppColors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 23.0),
                                  child: Row(
                                    children: [
                                      ClipOval(
                                        child: Image.asset(
                                          AppImages.userPlaceholder,
                                          height: 46,
                                          width: 46,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Wrap(
                                          spacing: 10,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  NameFormatter.formatName(
                                                    context: context,
                                                    name: state.dc![index].name,
                                                  ),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  sl<PhoneNumberEncryptor>()
                                                      .decrypt(state.dc![index]
                                                          .phoneNumber),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF838383)),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            Text(
                                              state.dc![index].tags.first,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.mainAccent),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      AppTransparentButton(
                                        text: AppLocalizations.of(context)!
                                            .remove,
                                        onPressed: () {
                                          showAlertDialog(context,
                                              dcId: state.dc![index].id);
                                        },
                                        mainColor: AppColors.blue,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(),
                              ],
                            ),
                          ),
                        );
                      })),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    AppTransparentButton(
                      text: AppLocalizations.of(context)!.selectFromContacts,
                      onPressed: () {
                        // context.read<PickDcCubit>().reset();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectFromContactsScreen(
                                      dangerousContacts: state.dc!,
                                    )));
                      },
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.mainAccent),
                      height: 46,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 10),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    AppElevatedButton(
                      text:
                          AppLocalizations.of(context)!.addNumber.toLowerCase(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddDCScreen()));
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
        );
      },
    );
  }

  showAlertDialog(BuildContext context, {required String dcId}) {
    Widget cancelButton = TextButton(
      child: Text(
        AppLocalizations.of(context)!.cancel,
        style: const TextStyle(color: AppColors.black),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        AppLocalizations.of(context)!.delete,
        style: const TextStyle(color: AppColors.mainAccent),
      ),
      onPressed: () {
        context.read<DcBloc>().add(DcEvent.removeFromDC(dcId: dcId));
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: Text(AppLocalizations.of(context)!.warning,
          style: AppTheme.themeData.textTheme.titleSmall),
      content: Text(AppLocalizations.of(context)!.youSureWantDelete,
          style: AppTheme.themeData.textTheme.bodySmall!
              .copyWith(color: Colors.black)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
