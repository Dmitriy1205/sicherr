import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/utils/send_sos.dart';
import 'package:sicherr/data/remote/fcm_service.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/timer/timer_bloc.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';

import '../../../core/service_locator/service_locator.dart';

class TimerScreen extends StatelessWidget {
  final TimerBloc _timerBloc = sl<TimerBloc>();

  TimerScreen(){
    _timerBloc.add(TimerEvent.fetchStatus());
  }

  Map<String, int> _secondsVariants(BuildContext context) => {
        "-": 0,
        AppLocalizations.of(context)!.minutes_count("30"): 30 * 60,
        AppLocalizations.of(context)!.hour_count("1"): 60 * 60,
        AppLocalizations.of(context)!.hours_count("2"): 2 * 60 * 60,
        AppLocalizations.of(context)!.hours_count("3"): 3 * 60 * 60,
        AppLocalizations.of(context)!.hours_count("4"): 4 * 60 * 60,
        AppLocalizations.of(context)!.hours_count("6"): 6 * 60 * 60,
        AppLocalizations.of(context)!.hours_count("12"): 12 * 60 * 60,
        AppLocalizations.of(context)!.hours_count("24"): 24 * 60 * 60,
      };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerBloc, TimerState>(
      bloc: _timerBloc,
      listener: (context, state) {
        state.maybeMap(
            timerStarted: (state) {
              sl<FCMService>().showNotification(
                  title: AppLocalizations.of(context)!.timer_started,
                  body:
                      "${AppLocalizations.of(context)!.timer_has_been_set_to} ${_secondsVariants(context).entries.where((e) => e.value == state.seconds).firstOrNull?.key ?? ""}");
            },
            timerEnded: (state){
              if(state.sendSOS){
                sendSos(context);
              }
              sl<FCMService>().showNotification(
                  title: AppLocalizations.of(context)!.timer_expired,
                  body: AppLocalizations.of(context)!.sos_sent);
            },
            orElse: () {});
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 46,
                ),
                state.started ? const SizedBox.shrink() : _introText(context),
                const Spacer(),
                state.maybeMap(
                    ticking: (state) => _timerTicking(
                        context: context,
                        seconds: state.seconds,
                        maxSeconds: state.setSeconds),
                    orElse: () => _timerSetup(
                        context: context,
                        seconds: state.seconds,
                        selectedVariant: _secondsVariants(context)
                            .entries
                            .firstWhere((e) => e.value == state.seconds)
                            .key,
                        variants: _secondsVariants(context)
                            .keys
                            .map((e) => e)
                            .toList(),
                        onVariantChanged: (item) {
                          _timerBloc.add(TimerEvent.pickTime(
                              _secondsVariants(context)[item]!));
                        })),
                const Spacer(),
                state.started
                    ? _stopButton(
                        context: context,
                        onTap: () {
                          _timerBloc
                              .add(const TimerEvent.stopTimer(sendSOS: false));
                        })
                    : _startButton(
                        context: context,
                        isEnabled: state.seconds != 0,
                        onTap: () {
                          final profileInfo = context.read<ProfileBloc>().state.profileInfo!;
                          final phone = profileInfo.phone;
                          final sosMessage = profileInfo.sosMessage;
                          final emergencyPhones = context
                              .read<EmergencyContactBloc>()
                              .state
                              .emContacts
                              .map((e) => e.phoneNumber)
                              .toList();
                          _timerBloc.add(TimerEvent.startTimer(
                              sosMessage: sosMessage,
                              emergencyPhones: emergencyPhones,
                              warningTitle: AppLocalizations.of(context)!.timer,
                              warningMessage: AppLocalizations.of(context)!.timer_will_expire_in_5_mins,
                              triggerTitle: AppLocalizations.of(context)!.timer_expired,
                              triggerMessage: AppLocalizations.of(context)!.sos_sent,
                              phone: phone));
                        }),
                const SizedBox(
                  height: 51,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _startButton(
          {required BuildContext context,
          required bool isEnabled,
          required VoidCallback onTap}) =>
      _button(
          context: context,
          isEnabled: isEnabled,
          text: AppLocalizations.of(context)!.start,
          color: AppColors.blue,
          onTap: onTap);

  Widget _stopButton(
          {required BuildContext context, required VoidCallback onTap}) =>
      _button(
          context: context,
          isEnabled: true,
          text: AppLocalizations.of(context)!.stop,
          color: AppColors.red,
          onTap: onTap);

  Widget _button(
          {required BuildContext context,
          required bool isEnabled,
          required String text,
          required Color color,
          required VoidCallback onTap}) =>
      SizedBox(
        width: 154,
        child: AppElevatedButton(
            borderRadius: 31,
            color: !isEnabled ? AppColors.grey : color,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            text: text,
            onPressed: () {
              if (!isEnabled) return;
              onTap.call();
            }),
      );

  Widget _introText(BuildContext context) => Text(
        AppLocalizations.of(context)!.timer_hint,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.greyDark),
        textAlign: TextAlign.center,
      );

  Widget _timerTicking(
      {required BuildContext context,
      required int seconds,
      required int maxSeconds}) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: CircularProgressIndicator(
                        color: AppColors.lightGrey, value: 1)),
              ),
              SizedBox(
                width: double.infinity,
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Transform.flip(
                        flipX: true,
                        child: CircularProgressIndicator(
                            strokeCap: StrokeCap.round,
                            color: Color(0xFFF066BF),
                            value: seconds / maxSeconds))),
              ),
              Center(
                child: Text(
                  _timerText(seconds),
                  style: TextStyle(fontSize: 50, color: AppColors.mainAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timerSetup(
          {required BuildContext context,
          required int seconds,
          required String selectedVariant,
          required List<String> variants,
          required Function(String) onVariantChanged}) =>
      GestureDetector(
        onTap: () {
          showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                        initialItem:
                            variants.indexWhere((e) => e == selectedVariant)),
                    itemExtent: 30,
                    onSelectedItemChanged: (i) {
                      onVariantChanged(variants[i]);
                    },
                    children: variants.map((e) => Text(e)).toList()),
              ),
            ),
          );
        },
        child: Text(
          _timerText(seconds),
          style: TextStyle(
              fontSize: 50,
              color: seconds > 0 ? AppColors.black : AppColors.grey),
        ),
      );
}

String _timerText(int seconds) {
  final secondsPart = seconds % 60;
  final minutes = seconds ~/ 60;
  final minutesPart = minutes % 60;
  final hoursPart = minutes ~/ 60;

  final secondsPadded = secondsPart.toString().padLeft(2, '0');
  final minutesPadded = minutesPart.toString().padLeft(2, '0');
  final hoursPadded = hoursPart.toString().padLeft(2, '0');
  return "$hoursPadded:$minutesPadded:$secondsPadded";
}
