// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:university/src/presentation/home/home.dart';
import 'package:university/src/presentation/four/Fore.dart';
import 'package:university/src/presentation/home/pages/HomePage.dart';
import 'package:university/src/presentation/home/pages/SecondPage.dart';
import 'package:university/src/presentation/home/pages/ThrerdPage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab = 0;
  final List<Widget> screens = const [
    HomePage(),
    SecondPage(),
    TherdPage(),
    Four(),
  ];

  Widget currentScreen = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[0];
                    currentTab = 0;
                  });
                },
                icon: const Icon(Icons.home),
                color: currentTab == 0 ? Colors.blue : Colors.grey,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[1];
                    currentTab = 1;
                  });
                },
                icon: const Icon(Icons.favorite),
                color: currentTab == 1 ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 48),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[2];
                    currentTab = 2;
                  });
                },
                icon: const Icon(Icons.person),
                color: currentTab == 2 ? Colors.blue : Colors.grey,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[3];
                    currentTab = 3;
                  });
                },
                icon: const Icon(Icons.settings),
                color: currentTab == 3 ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
