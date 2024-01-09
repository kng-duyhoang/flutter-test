import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/detail/schedule-information/index.dart';

class DetailSchedule extends StatefulWidget {
  const DetailSchedule({super.key});

  @override
  State<DetailSchedule> createState() => _DetailScheduleState();
}

class _DetailScheduleState extends State<DetailSchedule> {
  int indexKey = 0;

  var scheduleDetail = Schedule(nameSchedule: "", type: "", timeLine: [], id: "");
  String id = "" ;
  void getSchedule(String id) async {
    final response = await ScheduleApi().getDetailSchedule(id);
    setState(() {
      scheduleDetail = response.schedule;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      String id = ModalRoute.of(context)!.settings.arguments.toString();
      getSchedule(id);
    });
  }

  void changeIndex (int newIndex) {
    setState(() {
      indexKey = newIndex;
    });
  }

  Widget body() {
    switch(indexKey) {
      case 0:
        return  ScheduleInformation(schedule: scheduleDetail, changeIndex: changeIndex);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
