import 'package:flutter/material.dart';
import 'package:test_app/routes/routers.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('detail')),
      body: Column(children: [
        const Text('Detail Page'),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.settingPage);
          },
          child: const Text('go Setting'),
        ),
      ]),

    );
  }
}
