import 'package:flutter/material.dart';
import 'package:test_app/routes/routers.dart';
import 'package:test_app/widgets/bottom_bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String name = "hoang";
  void onPressed() {
    setState(() {
      name = "duy";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.homePage);
            },
            child: const Text('Go Home Page'),
          ),
          Text(name),
          ElevatedButton(
              onPressed: onPressed,
              child: const Text(
                'Change Name',
                selectionColor: Colors.black45,
              ))
        ]),
      ),
      bottomNavigationBar: const BottomBar('setting'),
    );
  }
}
