import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/utils/send_sos.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/sos_window/sos_window_cubit.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/scrollable_contacts_list.dart';

import '../../core/const/colors.dart';
import '../../core/theme/theme.dart';
import '../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Future<void> sosConfirmationPopup(BuildContext context,{ bool showPopup = true}) async {
  if(context.read<SosWindowCubit>().state) return;
  await Permission.sms.request();
  if(!context.mounted) return;

  context.read<SosWindowCubit>().openWindow();
  final confirmed = !showPopup ? true : await showDialog<bool?>(
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
                        .emContacts
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
                        .emContacts
                        .isEmpty
                    ? null : () {
                  Navigator.of(context).pop(true);
                }),
          ],
        ),
  );
  if(!context.mounted) return;
  context.read<SosWindowCubit>().closeWindow();
  if(confirmed != true) return;
  sendSos(context);
}
