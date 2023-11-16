import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: (
        Text('SettingPage')
      ),
      bottomNavigationBar: BottomBar('setting'),
    );
  }
}
