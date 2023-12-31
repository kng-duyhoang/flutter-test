import 'package:flutter/material.dart';
import 'package:healthy_app/router/index.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  void _onPressed () {
    Navigator.pushNamed(context, Routes.createSchedule);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, Routes.createSchedule);
            },
            tooltip: 'Add your Schedule',
          )
        ],
      ),
      body: Container(
        child: ElevatedButton(onPressed: _onPressed, child: const Text('Create'),)
      ),
    );
  }
}
