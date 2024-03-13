import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/managers/quick_binding_handler.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/shake_detector/shake_detector_bloc.dart';
import 'package:sicherr/presentation/screens/contacts/contacts.dart';
import 'package:sicherr/presentation/screens/home/home.dart';
import 'package:sicherr/presentation/screens/map/map.dart';
import 'package:sicherr/presentation/screens/profile/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sicherr/presentation/widgets/sos_confirmation_popup.dart';

import '../../core/service_locator/service_locator.dart';
import '../bloc/onboarding/onboarding_bloc.dart';
import '../widgets/app_toast.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedPage = 0;

  final screens = const [
    HomeScreen(),
    ContactsScreen(),
    MapScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    context.read<ProfileBloc>().add(const ProfileEvent.getProfileFields());

    context.read<OnboardingBloc>().add(const OnboardingEvent.get());
    sl<QuickBindingListener>().initListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.contacts,
      AppLocalizations.of(context)!.map,
      AppLocalizations.of(context)!.profile,
    ];
    return MultiBlocListener(
      listeners: [
        BlocListener<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            state.maybeMap(
                loaded: (_) async {
                  if (context
                      .read<OnboardingBloc>()
                      .state
                      .onboarding!
                      .isWelcome!) {
                    await alert(
                      context,
                      title: Text(AppLocalizations.of(context)!.welcome),
                      content: Text(AppLocalizations.of(context)!.enjoy),
                      textOK: InkWell(
                          onTap: () {
                            context.read<OnboardingBloc>().add(
                                const OnboardingEvent.update(
                                    data: {"isWelcome": false}));
                            Navigator.pop(context);
                          },
                          child: Text(
                            'OK',
                            style: AppTheme.themeData.textTheme.titleMedium!
                                .copyWith(color: Colors.black),
                          )),
                    );
                  }
                },
                orElse: () {});
          },
        ),
        BlocListener<SendSosBloc, SendSosState>(
          listener: (context, state) {
            state.maybeMap(
                success: (_) => AppToast.showSuccess(
                    context, AppLocalizations.of(context)!.sosSent),
                error: (error) => AppToast.showError(context, error.message),
                orElse: () {});
          },
        ),
        BlocListener<ShakeDetectorBloc, ShakeDetectorState>(
          listener: (context, state) {
            state.maybeMap(
                success: (_) {
                  sosConfirmationPopup(context).then((value) => context
                      .read<ShakeDetectorBloc>()
                      .add(const ShakeDetectorEvent.resetDetection()));
                },
                orElse: () {});
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            titles[_selectedPage],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.lightGrey,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: IndexedStack(
            index: _selectedPage,
            children: screens,
          ),
        ),
        bottomNavigationBar: _MyBottomNavigationBar(
          itemsLabel: titles,
          selectedIndex: _selectedPage,
          onItemTapped: (index) {
            setState(() => _selectedPage = index);
          },
        ),
      ),
    );
  }
}

class _MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final List<String> itemsLabel;

  const _MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.itemsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGrey,
            blurRadius: 1,
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          ...BottomNavBarItems.values.asMap().entries.map(
                (item) => BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 6, top: 10),
                    child: SvgPicture.asset(
                      item.value.getIconPath,
                      colorFilter: ColorFilter.mode(
                          selectedIndex == item.key
                              ? Theme.of(context).primaryColor
                              : AppColors.grey,
                          BlendMode.srcIn),
                      width: 20.5,
                      height: 22,
                    ),
                  ),
                  label: item.value.getLabel(context),
                ),
              ),
        ],
        backgroundColor: AppColors.lightGrey,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: AppColors.grey),
        unselectedItemColor: AppColors.grey,
        unselectedFontSize: 14,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: onItemTapped,
      ),
    );
  }
}

enum BottomNavBarItems {
  home,
  contacts,
  map,
  profile;

  String getLabel(BuildContext context) {
    return switch (this) {
      BottomNavBarItems.home => AppLocalizations.of(context)!.home,
      BottomNavBarItems.contacts => AppLocalizations.of(context)!.contacts,
      BottomNavBarItems.map => AppLocalizations.of(context)!.map,
      BottomNavBarItems.profile => AppLocalizations.of(context)!.profile,
    };
  }

  String get getIconPath {
    return switch (this) {
      BottomNavBarItems.home => AppIcons.home,
      BottomNavBarItems.contacts => AppIcons.contacts,
      BottomNavBarItems.map => AppIcons.map,
      BottomNavBarItems.profile => AppIcons.profile,
    };
  }
}
