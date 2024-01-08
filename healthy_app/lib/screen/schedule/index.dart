import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/router/index.dart';
import 'package:healthy_app/screen/home/schedule.dart';

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
        titleSpacing: 16,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                onPressed: () {}, 
                icon: Icon(Icons.add, color: AppColor.lightPrimaryColor,), 
                label: Text('Add'),
              ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.createSchedule);
            }, 
            child: const Text('Create')
          ),),
          const ScheduleList()
        ],
      ),
    );
  }
}
