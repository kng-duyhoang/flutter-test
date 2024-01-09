// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';

class DescriptionDetailSchedule extends StatefulWidget {
  const DescriptionDetailSchedule({required this.schedule, super.key});
  final Schedule schedule;

  @override
  State<DescriptionDetailSchedule> createState() =>
      _DescriptionDetailScheduleState();
}

class _DescriptionDetailScheduleState extends State<DescriptionDetailSchedule> {
  int length = 0;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColor.white1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.schedule.nameSchedule,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColor.blackColor1),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE3E7EC),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.schedule),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.schedule.type,
                      style: AppText.textGrey,
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFE3E7EC),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.local_activity),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      length.toString(),
                      style: AppText.textGrey,
                    )
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description', style: AppText.titleLarge),
                  SizedBox(height: 10),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type."
                    ,
                    style: AppText.textGrey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
