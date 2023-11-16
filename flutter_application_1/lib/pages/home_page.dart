import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: (
        Text('HomePage')
      ),
      bottomNavigationBar: BottomBar('home'),
    );
  }
}
