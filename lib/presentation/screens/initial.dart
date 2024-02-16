import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/strings.dart';
import 'package:sicherr/presentation/screens/contacts/contacts.dart';
import 'package:sicherr/presentation/screens/home/home.dart';
import 'package:sicherr/presentation/screens/map/map.dart';
import 'package:sicherr/presentation/screens/profile/profile.dart';

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

  final titles = [
    AppStrings.contacts,
    AppStrings.home,
    AppStrings.map,
    AppStrings.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'Contacts',
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
            label: 'Home',
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
            label: 'Map',
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
            label: 'Profile',
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
