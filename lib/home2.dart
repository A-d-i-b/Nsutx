import 'package:flutter/material.dart';
import 'package:nsutx/Attendance.dart';

import 'package:nsutx/todo/screens/todo_screens.dart';
import 'timetable.dart';
import 'home.dart';
import 'notific.dart';

class Home2 extends StatefulWidget {
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int index = 0;

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: false);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle:
              MaterialStateProperty.all(TextStyle(color: Colors.pink)),
          elevation: 5,
          indicatorColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) {
            setState(() {
              this.index = index;
            });

            pageController.jumpToPage(index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Home",
              selectedIcon: Icon(
                Icons.home,
                color: Colors.pink,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.how_to_reg),
              label: "Attendance",
              selectedIcon: Icon(
                Icons.person,
                color: Colors.pink,
              ),
            ),
            NavigationDestination(
              icon: Icon(Icons.checklist),
              label: "To-Do",
              selectedIcon: Icon(
                Icons.checklist,
                color: Colors.pink,
              ),
            ),
            NavigationDestination(
                icon: Icon(Icons.access_time),
                selectedIcon: Icon(
                  Icons.access_time,
                  color: Colors.pink,
                ),
                label: "Time-Table"),
            NavigationDestination(
              icon: Icon(Icons.notifications_rounded),
              label: "Notice",
              selectedIcon: Icon(
                Icons.notifications_rounded,
                color: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Home(),
          Attendance(),
          TaskScreen(),
          Time(),
          Notific(),
        ],
        onPageChanged: (page) {
          setState(() => index = page);
        },
      ),
    );
  }
}
