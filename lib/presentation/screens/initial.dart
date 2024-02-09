import 'package:flutter/material.dart';
import 'package:sicherr/core/const/colors.dart';
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
      appBar: AppBar(title: Text(titles[_selectedPage])),
      body: screens[_selectedPage],
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
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(color: AppColors.grey),
      unselectedItemColor: AppColors.grey,
      unselectedFontSize: 14,
      selectedItemColor: AppColors.mainAccent,
      type: BottomNavigationBarType.fixed,
      onTap: onItemTapped,
    );
  }
}
