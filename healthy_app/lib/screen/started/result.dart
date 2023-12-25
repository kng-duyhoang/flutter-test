// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/user/user.dart';

class ResultStatusScreen extends StatefulWidget {
  final UserInforModel data;
  const ResultStatusScreen(this.data, {super.key});

  @override
  State<ResultStatusScreen> createState() => _ResultStatusScreenState();
}

class _ResultStatusScreenState extends State<ResultStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result', style: AppText.titleLarge),
      ),
      body: Container(alignment: Alignment.center, child: Column(children: [
        FormValue('User Name', widget.data.userName),
        FormValue('Height', widget.data.height),
        FormValue('Weight', widget.data.weight),
        FormValue('Gender', widget.data.gender),
        FormValue('Birthday', widget.data.birthday),
      ]),),
    );
  }

  SizedBox FormValue(String label, String value) {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Text('$label: '),
            const SizedBox(width: 10),
            Text(value)
          ],
        ),
      );
  }
}
