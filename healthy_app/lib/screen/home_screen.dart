import 'package:flutter/material.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/store/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void removeToken() {
    Store.instance.remove(StoreKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.scheduleScreen);
            },
            child: const Text("Schedule")
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.settingScreen);
            },
            child: const Text("Setting")
          ),
        ],
      ),
    );
  }
}
