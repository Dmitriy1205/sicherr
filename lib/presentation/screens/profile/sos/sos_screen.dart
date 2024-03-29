import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/screens/profile/emergency_contacts/emergency_contacts.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/default_app_bar.dart';
import 'package:sicherr/presentation/widgets/sos_confirmation_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/const/colors.dart';
import '../../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../../widgets/app_switch.dart';
import '../../../widgets/scrollable_contacts_list.dart';


class SosScreen extends StatefulWidget {
  const SosScreen({super.key});

  @override
  State<SosScreen> createState() => _SosScreenState();
}

class _SosScreenState extends State<SosScreen> {
  late TextEditingController messageController;
  final focusNode = FocusNode();
  Position? position;

  bool? isQuickBinding;

  bool? isSendLocation;

  @override
  void initState() {
    isQuickBinding =
        context.read<ProfileBloc>().state.profileInfo?.enabledSosQB ?? false;
    isSendLocation =
        context.read<ProfileBloc>().state.profileInfo?.sendSosGeolocation ??
            false;
    messageController = TextEditingController(
        text: context.read<ProfileBloc>().state.profileInfo?.sosMessage ?? '');
    getCurrentPosition();
    super.initState();
  }

  getCurrentPosition() async {
    if (isSendLocation!) {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const DefaultAppBar(title:'SOS' ,),
      body: BlocConsumer<EmergencyContactBloc, EmergencyContactState>(
        listener: (context, state) {

          state.maybeMap(
              loaded: (s) {
                isQuickBinding = context
                        .read<ProfileBloc>()
                        .state
                        .profileInfo
                        ?.enabledSosQB ??
                    false;
                isSendLocation = context
                        .read<ProfileBloc>()
                        .state
                        .profileInfo
                        ?.sendSosGeolocation ??
                    false;
                messageController = TextEditingController(
                    text: context
                            .read<ProfileBloc>()
                            .state
                            .profileInfo
                            ?.sosMessage ??
                        '');
                getCurrentPosition();
              },
              orElse: () {});
        },
        builder:(context, state){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,),
            child: ListView(
              children: [
                const SizedBox(height: 15,),
                Text(
                  AppLocalizations.of(context)!.overview,
                  style: AppTheme.themeData.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppLocalizations.of(context)!.overviewDescription,
                  style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(color: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.quickBinding,
                      style: AppTheme.themeData.textTheme.displayLarge,
                    ),
                    AppSwitch(
                        value: isQuickBinding!,
                        onChanged: (v) {
                          setState(() {
                            isQuickBinding = v;
                            context.read<ProfileBloc>().add(
                                ProfileEvent.updateSpecificProfileField(
                                    data: {
                                      "enabledSosQB": v,
                                    }));
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppLocalizations.of(context)!.quickBindingDescription,
                  style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(color: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.device),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.volumeButton,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.greyDark),
                        ),
                        Text(
                          '  • 2 ${AppLocalizations.of(context)!.up.toLowerCase()}',
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.greyDark),
                        ),
                        Text(
                          '  • 2 ${AppLocalizations.of(context)!.down.toLowerCase()}',
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.greyDark),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EmergencyContactsScreen(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.emergencyContacts} (${context.read<EmergencyContactBloc>().state.emContacts?.length ?? 0})',
                          style: AppTheme.themeData.textTheme.displayLarge,
                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all( 3),
                            child: FaIcon(
                              FontAwesomeIcons.chevronRight,
                              color: AppColors.black,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                context.read<EmergencyContactBloc>().state.emContacts == null ||
                    context
                        .read<EmergencyContactBloc>()
                        .state
                        .emContacts!
                        .isEmpty
                    ? const SizedBox()
                    : Column(

                  children: [
                    const SizedBox(
                      height: 37,
                    ),
                    SizedBox(
                      height: 135,
                      width: MediaQuery.of(context).size.width,
                      child: const ScrollableContactList(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: TextFormField(
                    controller: messageController,
                    focusNode: focusNode,
                    maxLines: 4,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: AppColors.mainAccent),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        hintText: AppLocalizations.of(context)!.sosMessage,
                        hintStyle: AppTheme.themeData.textTheme.titleMedium,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 10)),
                    onChanged: (value) {
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        context
                            .read<ProfileBloc>()
                            .add(ProfileEvent.updateSpecificProfileField(data: {
                          "sosMessage": messageController.text,
                        }));
                      });
                    },
                    onTapOutside: (v) {
                      focusNode.unfocus();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.sendYourGeolocation,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(color: AppColors.black),
                      ),
                      AppSwitch(
                        value: isSendLocation!,
                        onChanged: (v) async {
                          LocationPermission permission =
                          await Geolocator.checkPermission();

                          if (permission == LocationPermission.deniedForever) {
                            setState(() {
                              isSendLocation = false;
                            });
                            openAppSettings();
                          }
                          if (permission == LocationPermission.denied) {
                            setState(() {
                              isSendLocation = false;
                            });
                            await Geolocator.requestPermission();
                          } else {
                            position = await Geolocator.getCurrentPosition(
                              desiredAccuracy: LocationAccuracy.high,
                            );
                            setState(() {
                              isSendLocation = v;
                              context.read<ProfileBloc>().add(
                                  ProfileEvent.updateSpecificProfileField(
                                      data: {
                                        "sosMessage": messageController.text,
                                      }));
                            });
                            if (mounted) {
                              context.read<ProfileBloc>().add(
                                ProfileEvent.updateSpecificProfileField(
                                  data: {"sendSosGeolocation": v},
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 39,
                ),
                Text(
                  AppLocalizations.of(context)!.activate,
                  style: AppTheme.themeData.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppLocalizations.of(context)!.activateDescription,
                  style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(color: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 21,
                ),
                AppElevatedButton(
                    text: AppLocalizations.of(context)!.send,
                    onPressed: () {
                      sosConfirmationPopup(context, latitude: position?.latitude.toString(), longitude: position?.longitude.toString());
                    }),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        } ,
        // child: ,
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
