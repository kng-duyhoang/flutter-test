// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:healthy_app/screen/home/index.dart';
import 'package:healthy_app/screen/schedule/list-schedule/index.dart';
import 'package:healthy_app/screen/setting/index.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int _indexKey = 0;

  void _onItemTapped(int index) {
    setState(() {
      _indexKey = index;
    });
  }

  Widget body() {
    switch (_indexKey) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ScheduleScreen();
      case 2:
        return const SettingScreen();
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Theme.of(context).colorScheme.background, width: 1.0)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0.0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Setting',
            ),
          ],
          currentIndex: _indexKey,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Theme.of(context).primaryColorLight,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
