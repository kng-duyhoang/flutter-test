import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    EasyLoading.show(status: 'loading...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Loading Page')),
    );
  }
}