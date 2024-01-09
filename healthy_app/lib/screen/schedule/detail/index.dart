import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/detail/cover.dart';
import 'package:healthy_app/screen/schedule/detail/description.dart';

class DetailSchedule extends StatefulWidget {
  const DetailSchedule({super.key});

  @override
  State<DetailSchedule> createState() => _DetailScheduleState();
}

class _DetailScheduleState extends State<DetailSchedule> {
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
              DescriptionDetailSchedule(schedule: scheduleDetail),
            ],
          ),
        ),
      ),
    );
  }
}
