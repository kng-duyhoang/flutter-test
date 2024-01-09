// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';

class ListDaySchedule extends StatefulWidget {
  ListDaySchedule({required this.changeScreen ,required this.schedule, super.key});

  Schedule schedule;
  Function changeScreen;

  @override
  State<ListDaySchedule> createState() => _ListDayScheduleState();
}

class _ListDayScheduleState extends State<ListDaySchedule> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("List day", style: AppText.titleLarge),
          SizedBox(
            width: double.infinity,
            height: widget.schedule.timeLine.length == 1 ? 100 : widget.schedule.timeLine.length * 62,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.schedule.timeLine.length, 
              itemBuilder: (context, index) => DayBlock(index: index, changeScreen: widget.changeScreen)
            )
          ),
        ],
      ),
    );
  }
}

class DayBlock extends StatelessWidget {
  DayBlock({
    required this.index,
    required this.changeScreen,
    super.key,
  });

  int index;
  Function changeScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeScreen(index);
      },
      child: Card(
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.only(top: 12),
        borderOnForeground: false,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(width: 1.0, color: AppColor.borderColor),
        ),
        child: SizedBox(
          height: 40,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Day ${(index + 1).toString()}', style: AppText.titleMedium),
                const Icon(Icons.arrow_right_alt, color: AppColor.blackColor1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
