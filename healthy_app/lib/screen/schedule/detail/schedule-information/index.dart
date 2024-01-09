// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/cover.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/description.dart';

class ScheduleInformation extends StatefulWidget {
  ScheduleInformation({required this.changeIndex, required this.schedule,super.key});
  Schedule schedule;
  Function changeIndex;

  @override
  State<ScheduleInformation> createState() => _ScheduleInformationState();
}

class _ScheduleInformationState extends State<ScheduleInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.detailCover),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              CoverDetail(),
              DescriptionDetailSchedule(schedule: widget.schedule),
            ],
          ),
        ),
      ),
    );
  }
}
