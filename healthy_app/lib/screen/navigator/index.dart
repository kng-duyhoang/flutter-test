// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/screen/home/index.dart';
import 'package:healthy_app/screen/setting_screen.dart';

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
    switch(_indexKey) {
      case 0:
        return const HomeScreen();
      case 1:
        return const SettingScreen();
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
        selectedItemColor: AppColor.lightPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
