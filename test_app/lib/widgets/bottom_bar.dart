import 'package:flutter/material.dart';
import 'package:test_app/routes/routers.dart';

class BottomBar extends StatefulWidget {
  final String idBar;

  const BottomBar(this.idBar, {super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int renderKey = 0;
  void renderKeyData() {
    switch (widget.idBar) {
      case 'home':
        setState(() {
          renderKey = 0;
        });
        break;
      case 'setting':
        setState(() {
          renderKey = 1;
        });
        break;
      default:
    }
  }

  void _rootingData(int key) {
    if (key != renderKey) {
      switch (key) {
        case 0:
          Navigator.pushNamed(context, Routes.homePage);
          break;
        case 1:
          Navigator.pushNamed(context, Routes.settingPage);
          break;
        default:
          break;
      }
    }
  }

  @override
  initState() {
    super.initState();
    renderKeyData();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: renderKey,
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
      onTap: (index) {
        _rootingData(index);
      },
    );
  }
}
