import 'package:flutter/material.dart';
import 'package:test_app/pages/home_page.dart';
import 'package:test_app/pages/personal_page.dart';
import 'package:test_app/pages/setting_page.dart';

class FirstPage extends StatefulWidget {
  final int idPage;
  const FirstPage(this.idPage, {super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _indexKey = 0;
  
  final List _pages = [
    const HomePage(),
    const SettingPage(),
    const PersonalPage()
  ];

  void _navigateBottomBar (int key) {
    setState(() {
      _indexKey = key;
    });
  }
  @override
  initState() {
    super.initState();
    setState(() {
      _indexKey = widget.idPage;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_indexKey],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexKey,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
            backgroundColor: Colors.blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
            backgroundColor: Colors.blue)
        ],
      ),
    );
  }
}
