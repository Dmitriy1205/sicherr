import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
            AnimatedOpacity(
              opacity: selectedIndex == 0 ? 1 : 0.4,
              duration: const Duration(milliseconds: 200),
              child: CircleActionButton(
                  text: 'SOS',
                  onTap: () {
                    if (selectedIndex == 0) {
                      sosConfirmationPopup(context);
                    } else {
                      _goToNextButton(0);
                    }
                  }),
            ),
            AnimatedOpacity(
              opacity: selectedIndex == 1 ? 1 : 0.4,
              duration: const Duration(milliseconds: 200),
              child: CircleActionButton(
                text: AppLocalizations.of(context)!.startAlarm,
                onTap: () {
                  if (selectedIndex == 1) {
                    //TODO:
                    print('START ALARM');
                  } else {
                    _goToNextButton(1);
                  }
                },
                gradientColors: const [Color(0xFFE4E4E4), Color(0xFF9B9B9B)],
              ),
            ),
          ]),
    );
  }

  _goToNextButton(int page) {
    selectedIndex = page;
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
    );
  }
}
