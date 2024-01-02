import 'package:flutter/material.dart';
import 'package:healthy_app/apis/activity/index.dart';
import 'package:healthy_app/bloc/activity/activity_bloc.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/create/create_detail.dart';
import 'package:healthy_app/screen/schedule/create/create_infor.dart';

class CreateScheduleScreen extends StatefulWidget {
  const CreateScheduleScreen({super.key});

  @override
  State<CreateScheduleScreen> createState() => _CreateScheduleScreenState();
}

class _CreateScheduleScreenState extends State<CreateScheduleScreen> {
  int _indexKey = 0;
  Schedule listSchedule = Schedule(name: "", type: "Day", items: [DaySchedule(items: [])]);
  
  List<Schedule> listShedule = [];
  int lengthList = 1;
  int onActive = 0;

  void goPage(int key) {
    setState(() {
      _indexKey = key;
    });
  }

  void changeType (String type) {
    Schedule tempListSchedule = Schedule(name: listSchedule.name, type: type, items: []);
    if (type == "Day") {
      tempListSchedule.items.add(DaySchedule(items: []));
    } else {
      for (var i = 0; i < 7; i++) {
        tempListSchedule.items.add(DaySchedule(items: []));
      }
    }
    setState(() {
      listSchedule = tempListSchedule;
    });
  }

  void changeName (String name) {
    Schedule tempListSchedule = Schedule(name: name, type: listSchedule.type, items: listSchedule.items);
    setState(() {
      listSchedule = tempListSchedule;
    });
  }

  void getAcitivies() async {
    List<Activity> dataCheck = ActivityBloc.instance.state.list;
    if (dataCheck.isEmpty) {
      final response = await ScheduleApi().getListShedule();
      print(response);
      ActivityBloc.instance.add(ActivityEventUpdateSchedule(list: response.items));
    }
  } 
  
  Widget body() {
    switch(_indexKey) {
      case 0:
        return CreateInforSchedule(goPage, changeType, changeName, listSchedule);
      case 1:
        return CreateDetailSchedule(goPage, listSchedule);
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
    getAcitivies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }
}
