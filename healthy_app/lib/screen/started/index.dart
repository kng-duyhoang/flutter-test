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

  Map<String, dynamic> data = {
    'name': "",
    'birthDay': "",
    'gender': 0,
  };

  void goPage(int key) {
    setState(() {
      _indexKey = key;
    });
  }

  void changeData(dynamic value, String keyname) {
    setState(() {
      data[keyname] = value;
    });
  }

  Widget body() {
    switch(_indexKey) {
      case 0:
        return HelloScreen(goPage);
      case 1:
        return UpdateStatusScreen(goPage, changeData);
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
