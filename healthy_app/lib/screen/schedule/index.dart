import 'package:flutter/material.dart';
import 'package:healthy_app/router/index.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.createSchedule);
          }, 
          child: const Text('Create')
        ),
      ),
    );
  }
}
