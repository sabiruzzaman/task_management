import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_management/screens/home/home_screen.dart';
import 'package:task_management/screens/notification/notification_screen.dart';
import 'package:task_management/screens/search/search_screen.dart';
import 'package:task_management/screens/task/tasks_screen.dart';

class BottomNevBar extends StatefulWidget {
  const BottomNevBar({super.key});

  @override
  State<BottomNevBar> createState() => _BottomNevBarState();
}

class _BottomNevBarState extends State<BottomNevBar> {

  final appScreens = [
    const HomeScreen(),
    null,
    null,
    const SearchScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    appScreens[1] = TaskScreen(goBack: (int index) {
      _onItemTapped(0);
    });
    appScreens[2] = NotificationScreen(goBack: (int index) {
      _onItemTapped(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 95, 69, 252),
        unselectedItemColor: Colors.grey.shade400,
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 242, 244, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.task_square),
            label: 'Tasks',
            backgroundColor: Color.fromARGB(255, 242, 244, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.notification),
            label: 'Notification',
            backgroundColor: Color.fromARGB(255, 242, 244, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: 'Search',
            backgroundColor: Color.fromARGB(255, 242, 244, 255),
          ),
        ],
      ),
    );
  }
}
