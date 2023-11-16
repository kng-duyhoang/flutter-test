import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/bottom_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: (
        Text('AboutPage')
      ),
      bottomNavigationBar: BottomBar('about'),
    );
  }
}
