import 'package:flutter/material.dart';
import 'package:test_app/routes/routers.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PersonalPage'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text("Personal Page"),
          ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.detailPage);
          },
          child: const Text('go detail'),
        ),
        ],
      ),
    );
  }
}
