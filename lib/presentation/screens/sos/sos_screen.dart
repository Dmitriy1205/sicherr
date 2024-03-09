import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/strings.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/sos_confirmation_popup.dart';

import '../../../core/const/colors.dart';
import '../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../widgets/app_switch.dart';
import '../../widgets/scrollable_contacts_list.dart';

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
      appBar: AppBar(
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.lightGrey,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColors.black,
                    size: 20,
                  ),
                ),
              ),
              Text(
                'SOS',
                style: AppTheme.themeData.textTheme.displayLarge,
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ),
      body: BlocListener<EmergencyContactBloc, EmergencyContactState>(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.overview,
                  style: AppTheme.themeData.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppStrings.overviewDescription,
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
                      AppStrings.quickBinding,
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
                  AppStrings.quickBindingDescription,
                  style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(color: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.phoneShake),
                    const SizedBox(
                      width: 36,
                    ),
                    Text(
                      AppStrings.phoneShake,
                      style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyDark),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppStrings.emergencyContacts} (${context.read<EmergencyContactBloc>().state.emContacts?.length ?? 0})',
                        style: AppTheme.themeData.textTheme.displayLarge,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: AppColors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
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
                        hintText: AppStrings.sosMessage,
                        hintStyle: AppTheme.themeData.textTheme.titleMedium,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 19, vertical: 10)),
                    onChanged: (value) {
                      String? message;
                      setState(() {
                        message = isSendLocation!
                            ? '$value\nhttps://www.google.com/maps?q=${position!.longitude},${position!.latitude}&z=15'
                            : value;
                      });

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
                        AppStrings.sendYourGeolocation,
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
                              isSendLocation!
                                  ? messageController.text =
                                      '${messageController.text}\nhttps://www.google.com/maps?q=${position!.longitude},${position!.latitude}&z=15'
                                  : messageController.text = '';
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
                  AppStrings.activate,
                  style: AppTheme.themeData.textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppStrings.activateDescription,
                  style: AppTheme.themeData.textTheme.titleMedium!
                      .copyWith(color: AppColors.greyDark),
                ),
                const SizedBox(
                  height: 21,
                ),
                AppElevatedButton(
                    text: AppStrings.send,
                    onPressed: () {
                      sosConfirmationPopup(context);
                    }),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
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
