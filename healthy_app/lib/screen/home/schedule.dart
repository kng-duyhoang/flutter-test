import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/response.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({super.key});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List<DayScheduleResponse> listRender = [];

  void getListSchedule() async {
    // final response = await ScheduleApi().getSchedule();
    // setState(() {
    //   listRender = response.items;
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 56),
        child: SizedBox(
            height: 158,
            width: double.infinity,
            child: Wrap(
                spacing: 8.0, // Khoảng cách giữa các item
                runSpacing: 8.0,
                children: List.generate(listRender.length,
                    (index) => Text(listRender[index].nameSchedule)))),
      ),
    );
  }
}
