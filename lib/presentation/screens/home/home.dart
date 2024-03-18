import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/screens/home/widgets/circle_action_button.dart';
import 'package:sicherr/presentation/widgets/sos_confirmation_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: HomeButtonsSlider()),
    );
  }
}

class HomeButtonsSlider extends StatefulWidget {
  const HomeButtonsSlider({
    super.key,
  });

  @override
  State<HomeButtonsSlider> createState() => _HomeButtonsSliderState();
}

class _HomeButtonsSliderState extends State<HomeButtonsSlider> {
  int selectedIndex = 0;
  final controller = CarouselController();
  Position? position;

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }


  getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse) {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Spacer(),
          _SOSWidget(
            position: position,
            isSelected: true,
            goToNextItem: _goToNextButton,
          ),
          SizedBox(height: 25,),
          _StartAlarm(
            isSelected: true,
            goToNextItem: _goToNextButton,
          ),
          Spacer()
        ],
      )
    );
    /*
    In case customer changes his mind of design
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            onPageChanged: (index, reason) =>
                setState(() => selectedIndex = index),
            initialPage: selectedIndex,
            aspectRatio: 1,
            height: 200,
            viewportFraction: 0.6,
            enableInfiniteScroll: false,
            scrollPhysics: const ClampingScrollPhysics(),
          ),
          items: [
            _SOSWidget(
              position: position,
              isSelected: selectedIndex == 0,
              goToNextItem: _goToNextButton,
            ),
            _StartAlarm(
              isSelected: selectedIndex == 1,
              goToNextItem: _goToNextButton,
            )
          ]),
    );*/
  }

  _goToNextButton(int page) {
    selectedIndex = page;
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
    );
  }
}

class _StartAlarm extends StatelessWidget {
  const _StartAlarm({required this.isSelected, required this.goToNextItem});
  final bool isSelected;
  final void Function(int) goToNextItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmBloc, AlarmState>(
      builder: (context, state) => state.maybeMap(
        loaded: (loadedState) => CircleActionButton(
          text: loadedState.isAlarmPlaying
              ? '${AppLocalizations.of(context)!.stop.toUpperCase()} ${AppLocalizations.of(context)!.alarm.toUpperCase()}'
              : '${AppLocalizations.of(context)!.start.toUpperCase()} ${AppLocalizations.of(context)!.alarm.toUpperCase()}',
          onTap: () {
            if (isSelected) {
              if (loadedState.isAlarmPlaying) {
                sl<AlarmBloc>().add(const AlarmEvent.stopAlarm());
              } else {
                sl<AlarmBloc>().add(const AlarmEvent.playAlarm());
              }
            } else {
              goToNextItem(1);
            }
          },
          gradientColors: const [Color(0xFFE4E4E4), Color(0xFF9B9B9B)],
          isSelected: isSelected,
          isActive: loadedState.isAlarmPlaying,
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

class _SOSWidget extends StatelessWidget {
  const _SOSWidget({required this.isSelected, required this.goToNextItem, this.position});
  final bool isSelected;
  final void Function(int) goToNextItem;
  final Position? position;

  @override
  Widget build(BuildContext context) {
    return CircleActionButton(
        text: 'SOS',
        onTap: () {

          if (isSelected) {

            sosConfirmationPopup(context, latitude: position?.latitude.toString(), longitude: position?.longitude.toString());
          } else {
            goToNextItem(0);
          }
        },
        isSelected: isSelected);
  }
}
