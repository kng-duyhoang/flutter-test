// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/cover.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/description.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScheduleInformation extends StatefulWidget {
  ScheduleInformation({required this.schedule, required this.changeIndex, super.key});

  Schedule schedule;
  Function changeIndex;

  @override
  State<ScheduleInformation> createState() => _ScheduleInformationState();
}

class _ScheduleInformationState extends State<ScheduleInformation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.schedule.id == ""
          ? SizedBox(
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
                ),
                child: Column(
                  children: [
                    CoverDetail(),
                    Container(
                      color: Colors.white,
                      child: Column(children: [
                          DescriptionDetailSchedule(schedule: widget.schedule),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("List day", style: AppText.titleLargeLight),
                                TextButton(onPressed: () {
                                  widget.changeIndex(1);
                                }, child: Text('View Detail', style: AppText.textSecondary))
                              ],
                            ),
                          )
                        ]),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
