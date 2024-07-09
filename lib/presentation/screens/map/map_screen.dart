import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/utils/send_sos.dart';
import 'package:sicherr/presentation/bloc/map/home_position/home_position_cubit.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/screens/map/widgets/map.dart';
import 'package:sicherr/presentation/screens/map/widgets/map_search_field.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';

import '../../../core/utils/dialogs.dart';
import '../../../core/utils/phone_encryptor.dart';
import '../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../bloc/profile/profile_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePositionCubit, HomePositionState>(
      listener: (context, state) {
        state.maybeMap(
            successfullyFinished: (state) {
              AppDialogs.showArrivedDialog(context);
              final phoneNumber =
                  context.read<ProfileBloc>().state.profileInfo!.phone;
              context.read<HomePositionCubit>().notifyEtaContacts(
                data: {},
                  title: PhoneNumberEncryptor().decrypt(phoneNumber),
                  message: AppLocalizations.of(context)!.contact_successfully_arrived);
            },
            navigationFailed: (state) async {
              AppDialogs.showNavigationFailed(context);
              sendSos(context);
              final phoneNumber =
                  context.read<ProfileBloc>().state.profileInfo!.phone;
              context.read<HomePositionCubit>().notifyEtaContacts(
                  title: PhoneNumberEncryptor().decrypt(phoneNumber),
                  data: {},
                  message: AppLocalizations.of(context)!.contact_out_of_route);
            },
            orElse: () {});
      },
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            const MapBody(),
            context.watch<SendSosBloc>().state.isStreamingSOS
                ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: AppElevatedButton(text: AppLocalizations.of(context)!.end_sos, width: 0, onPressed: () {
                      context.read<SendSosBloc>().add(SendSosEvent.stopStreaming());
                    }),
                  ),
                )
                : SizedBox.shrink(),
            state.maybeMap(
                navigating: (state) {
                  if (state.showWarning) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            top: 150, left: 16, right: 16),
                        child: Container(
                          width: double.infinity,
                          height: 82,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8.7,
                                    offset: const Offset(0, 1),
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.warning,
                                color: AppColors.red,
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Expanded(
                                  child: Text(
                                AppLocalizations.of(context)!
                                    .about_to_leave_route,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500),
                              )),
                            ],
                          ),
                        ));
                  }
                  return Padding(
                      padding:
                          const EdgeInsets.only(top: 150, left: 16, right: 16),
                      child: Container(
                        width: double.infinity,
                        height: 82,
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: const Color(0xFFD662AD)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.route,
                              color: Colors.white,
                              size: 32,
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              AppLocalizations.of(context)!.minutes_left(
                                  state.minutesLeft > 60
                                      ? "> 60"
                                      : state.minutesLeft.toString()),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ));
                },
                orElse: () => const SizedBox.shrink()),
            const Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: MapSearchField(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
