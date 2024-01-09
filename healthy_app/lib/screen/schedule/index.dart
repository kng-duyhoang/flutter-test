import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/screen/schedule/list-schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.createSchedule);
                }, 
                icon: const Icon(Icons.add, color: AppColor.lightPrimaryColor,), 
                label: const Text('Add'),
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body:const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScheduleList(label: 'Your Schedule')
        ],
      ),
    );
  }
}
