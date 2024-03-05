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
    HomeScreen(),
    ContactsScreen(),
    MapScreen(),
    ProfileScreen(),
  ];

  final titles = [
    AppStrings.home,
    AppStrings.contacts,
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
        itemsLabel: titles,
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
          ...BottomNavBarItems.values 
          .asMap().entries.map(
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
                  label: item.value.getLabel,
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

   String get getLabel {
   return switch (this) {
     BottomNavBarItems.home => AppStrings.home,
     BottomNavBarItems.contacts => AppStrings.contacts,
     BottomNavBarItems.map => AppStrings.map,
     BottomNavBarItems.profile => AppStrings.profile,
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
