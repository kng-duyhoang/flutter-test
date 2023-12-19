import 'package:flutter/material.dart';
import 'package:healthy_app/screen/started/hello_screen.dart';
import 'package:healthy_app/screen/started/update_status_screen.dart';

class StartNavigation extends StatefulWidget {
  const StartNavigation({super.key});

  @override
  State<StartNavigation> createState() => _StartNavigationState();
}

class _StartNavigationState extends State<StartNavigation> {
  int _indexKey = 0;

  void goPage2() {
    setState(() {
      _indexKey = 1;
    });
  }

  Widget body() {
    switch(_indexKey) {
      case 0: 
        return HelloScreen(goPage2: goPage2);
      case 1: 
        return const UpdateStatusScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }
}
