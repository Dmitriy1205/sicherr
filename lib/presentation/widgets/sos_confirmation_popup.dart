import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/scrollable_contacts_list.dart';

import '../../core/const/colors.dart';
import '../../core/theme/theme.dart';
import '../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Future<void> sosConfirmationPopup(BuildContext context,{ String? latitude, String? longitude}) async {
  if(context.read<SendSosBloc>().state.isDialogOpened) return;

  context.read<SendSosBloc>().add(const SendSosEvent.openDialog());
  final confirmed = await showDialog<bool?>(
    context: context,
    builder: (BuildContext context) =>
        AlertDialog(
          insetPadding: const EdgeInsets.all(35),
          title: Center(
            child: Text(
              'SOS',
              style: AppTheme.themeData.textTheme.displayLarge,
            ),
          ),
          content: SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.sosDescription,
                  textAlign: TextAlign.center,
                  style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(color: AppColors.greyDark),
                ),
                context
                    .read<EmergencyContactBloc>()
                    .state
                    .emContacts == null ||
                    context
                        .read<EmergencyContactBloc>()
                        .state
                        .emContacts!
                        .isEmpty
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(AppLocalizations.of(context)!.noEmContacts,
                      style: AppTheme.themeData.textTheme.labelSmall!
                          .copyWith(color: Colors.red)),
                )
                    : Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 135,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: const ScrollableContactList(),
                    ),
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppIcons.message),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppLocalizations.of(context)!.message,
                                style: AppTheme.themeData.textTheme.labelSmall!
                                    .copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                !context
                                    .read<ProfileBloc>()
                                    .state
                                    .profileInfo!
                                    .sendSosGeolocation ? Icons.close : Icons
                                    .check,
                                size: 15,
                                color: !context
                                    .read<ProfileBloc>()
                                    .state
                                    .profileInfo!
                                    .sendSosGeolocation ? Colors.red : AppColors
                                    .greenLight,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                AppLocalizations.of(context)!.geolocation,
                                style: AppTheme.themeData.textTheme.titleSmall!
                                    .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: !context
                                        .read<ProfileBloc>()
                                        .state
                                        .profileInfo!
                                        .sendSosGeolocation
                                        ? Colors.red
                                        : AppColors.greenLight),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        context
                            .read<ProfileBloc>()
                            .state
                            .profileInfo
                            ?.sosMessage ==
                            null ||
                            context
                                .read<ProfileBloc>()
                                .state
                                .profileInfo!
                                .sosMessage
                                .isEmpty
                            ? 'SOS'
                            : context
                            .read<ProfileBloc>()
                            .state
                            .profileInfo!
                            .sosMessage,
                        style: AppTheme.themeData.textTheme.titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            AppElevatedButton(
                text: '${AppLocalizations.of(context)!.send} SOS',
                style: AppTheme.themeData.textTheme.labelSmall,
                onPressed: context
                    .read<EmergencyContactBloc>()
                    .state
                    .emContacts == null ||
                    context
                        .read<EmergencyContactBloc>()
                        .state
                        .emContacts!
                        .isEmpty
                    ? null : () {
                  Navigator.of(context).pop(true);
                }),
          ],
        ),
  );
  if(confirmed != true || !context.mounted) return;
  context.read<SendSosBloc>().add(const SendSosEvent.closeDialog());

  var profileInfo = context.read<ProfileBloc>().state.profileInfo;
  var sosMessage = profileInfo?.sosMessage;
  var currentUserPhone = profileInfo?.phone;
  List<String> emContactPhoneList = context.read<EmergencyContactBloc>().state.emContacts!.map((contact) => contact.phoneNumber).toList();
  context.read<SendSosBloc>().add(SendSosEvent.sendSOS(
    message: sosMessage == null || sosMessage.isEmpty ? 'SOS' : sosMessage,
    currentUserPhone: currentUserPhone!,
    emContactPhone: emContactPhoneList, lat: latitude, long: longitude ,
  ));
}
