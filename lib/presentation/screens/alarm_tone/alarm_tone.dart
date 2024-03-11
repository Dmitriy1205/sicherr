import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/app_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sicherr/presentation/widgets/default_app_bar.dart';

class AlarmTone extends StatefulWidget {
  const AlarmTone({super.key});

  @override
  State<AlarmTone> createState() => _AlarmToneState();
}

class _AlarmToneState extends State<AlarmTone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.alarmTone,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OverviewSection(),
              const SizedBox(height: 27),
              _QuickBindingSection(),
              const SizedBox(height: 20),
              _ActivateSection(),
              const SizedBox(height: 21),
              const _PlayButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmBloc, AlarmState>(
      builder: (context, state) => state.maybeMap(
        loaded: (loadedState) => AppElevatedButton(
            text: loadedState.isAlarmPlaying
                ? AppLocalizations.of(context)!.stop
                : AppLocalizations.of(context)!.start,
            onPressed: () {
              if (loadedState.isAlarmPlaying) {
                sl<AlarmBloc>().add(const AlarmEvent.stopAlarm());
              } else {
                sl<AlarmBloc>().add(const AlarmEvent.playAlarm());
              }
            }),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

class _QuickBindingSection extends StatefulWidget {
  @override
  State<_QuickBindingSection> createState() => _QuickBindingSectionState();
}

class _QuickBindingSectionState extends State<_QuickBindingSection> {
  bool isQuickBinding = false;
  @override
  void initState() {
    super.initState();
    isQuickBinding =
        context.read<ProfileBloc>().state.profileInfo?.alarmToneQB ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.quickBinding,
              style: AppTheme.themeData.textTheme.displayLarge,
            ),
            AppSwitch(
                value: isQuickBinding,
                onChanged: (value) {
                  context
                      .read<ProfileBloc>()
                      .add(ProfileEvent.updateSpecificProfileField(data: {
                        "alarmToneQB": value,
                      }));
                }),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          AppLocalizations.of(context)!.quickBindingDesc,
          style: AppTheme.themeData.textTheme.titleMedium!
              .copyWith(color: AppColors.greyDark),
        ),
        const SizedBox(height: 15),
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
      ],
    );
  }
}

class _OverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.overview,
          style: AppTheme.themeData.textTheme.displayLarge,
        ),
        const SizedBox(height: 12),
        Text(
          AppLocalizations.of(context)!.alarmDesc,
          style: AppTheme.themeData.textTheme.titleMedium!
              .copyWith(color: AppColors.greyDark),
        ),
      ],
    );
  }
}

class _ActivateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.activate,
          style: AppTheme.themeData.textTheme.displayLarge,
        ),
        const SizedBox(height: 12),
        Text(
          AppLocalizations.of(context)!.alternativeActivateDesc,
          style: AppTheme.themeData.textTheme.titleMedium!
              .copyWith(color: AppColors.greyDark),
        ),
      ],
    );
  }
}
