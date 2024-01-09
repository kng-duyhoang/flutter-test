// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/cover.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/description.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/list-dayschedule.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScheduleInformation extends StatefulWidget {
  ScheduleInformation({required this.schedule, required this.changeScreen, super.key});

  Schedule schedule;
  Function changeScreen;

  @override
  State<ScheduleInformation> createState() => _ScheduleInformationState();
}

class _ScheduleInformationState extends State<ScheduleInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.schedule.id == ""
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: LoadingAnimationWidget.newtonCradle(
                  color: AppColor.lightPrimaryColor,
                  size: 100,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.detailCover),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white,
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(children: [
                          DescriptionDetailSchedule(schedule: widget.schedule),
                          Container(
                            constraints: BoxConstraints(
                              minHeight: 200, minWidth: double.infinity
                            ),
                            child: ListDaySchedule(schedule: widget.schedule, changeScreen: widget.changeScreen)),
                        ]),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
