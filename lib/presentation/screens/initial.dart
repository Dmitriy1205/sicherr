import 'package:alert_dialog/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/screens/contacts/contacts.dart';
import 'package:sicherr/presentation/screens/home/home.dart';
import 'package:sicherr/presentation/screens/map/map.dart';
import 'package:sicherr/presentation/screens/profile/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/onboarding/onboarding_bloc.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedPage = 0;

  final screens = const [
    ContactsScreen(),
    HomeScreen(),
    MapScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    context.read<OnboardingBloc>().add(const OnboardingEvent.get());


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final titles = [
      AppLocalizations.of(context)!.contacts,
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.map,
      AppLocalizations.of(context)!.profile,
    ];
    return BlocListener<OnboardingBloc, OnboardingState>(
  listener: (context, state) {
   state.maybeMap(
       loaded: (_)async{
         if (context.read<OnboardingBloc>().state.onboarding!.isWelcome!) {
           await alert(
           context,
           title: Text(AppLocalizations.of(context)!.welcome),
           content: Text(AppLocalizations.of(context)!.enjoy),
           textOK: InkWell(
               onTap: (){
                 context.read<OnboardingBloc>().add(const OnboardingEvent.update(data: {"isWelcome": false}));
                 Navigator.pop(context);
               },
               child:  Text('OK',style: AppTheme.themeData.textTheme.titleMedium!.copyWith(color: Colors.black),)),
           );
         }
       },
       orElse: (){});
  },
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

  const _MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
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
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 10),
              child: SvgPicture.asset(
                AppIcons.contacts,
                color: selectedIndex == 0
                    ? Theme.of(context).primaryColor
                    : AppColors.grey,
                width: 22,
                height: 22,
              ),
            ),
            label: AppLocalizations.of(context)!.contacts,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 10),
              child: SvgPicture.asset(
                AppIcons.home,
                color: selectedIndex == 1
                    ? Theme.of(context).primaryColor
                    : AppColors.grey,
                width: 20.5,
                height: 22,
              ),
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 10),
              child: SvgPicture.asset(
                AppIcons.map,
                color: selectedIndex == 2
                    ? Theme.of(context).primaryColor
                    : AppColors.grey,
                width: 16.5,
                height: 22,
              ),
            ),
            label: AppLocalizations.of(context)!.map,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 10),
              child: SvgPicture.asset(
                AppIcons.profile,
                color: selectedIndex == 3
                    ? Theme.of(context).primaryColor
                    : AppColors.grey,
                width: 22,
                height: 22,
              ),
            ),
            label: AppLocalizations.of(context)!.profile,
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
