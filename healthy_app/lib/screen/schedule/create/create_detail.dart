import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/authorize/index.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/bloc/timer/timer_bloc.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/model/timer/index.dart';
import 'package:healthy_app/widget/dialog/addActivity.dart';
import 'package:healthy_app/widget/dialog/timerClock.dart';

class CreateDetailSchedule extends StatefulWidget {
  late Schedule listSchedule;
  late Function(int) goPage;

  CreateDetailSchedule(this.goPage, this.listSchedule, {super.key});

  @override
  State<CreateDetailSchedule> createState() => _CreateDetailScheduleState();
}

class _CreateDetailScheduleState extends State<CreateDetailSchedule> {
  int onActive = 0;
  DaySchedule currentDaySchedule = DaySchedule(itemsActivity: []);

  void changeActive(int index) {
    setState(() {
      onActive = index;
      for (var i = 0; i < widget.listSchedule.timeLine.length; i++) {
        if (onActive == i) {
          currentDaySchedule = widget.listSchedule.timeLine[i];
        }
      }
    });
  }

  void _addItem(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            AddActivityDialog(context, addActivity));
  }

  void addHourToActivity(String type, int timeID, int index) {
    ActivitySchedule activityTemp =
        widget.listSchedule.timeLine[onActive].itemsActivity[index];
    final ActivitySchedule data;
    if (type == "startTime") {
      data = ActivitySchedule(
          endTime: activityTemp.endTime,
          activity: activityTemp.activity,
          startTime: timeID,
          name: activityTemp.name,
          itemsSubActivity: []);
    } else {
      data = ActivitySchedule(
          endTime: timeID,
          activity: activityTemp.activity,
          startTime: activityTemp.startTime,
          name: activityTemp.name,
          itemsSubActivity: []);
    }

    setState(() {
      widget.listSchedule.timeLine[onActive].itemsActivity[index] = data;
    });
  }

  void addActivity(ActivitySchedule dataResponse) {
    final ActivitySchedule data = ActivitySchedule(
        endTime: -1,
        activity: dataResponse.activity,
        startTime: -1,
        name: dataResponse.name,
        itemsSubActivity: []);
    setState(() {
      widget.listSchedule.timeLine[onActive].itemsActivity.add(data);
    });
    changeActive(onActive);
  }

  void createSchedule() async {
    final response = await ScheduleApi().createSchedule(widget.listSchedule);
    //
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Create Schedule"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => widget.goPage(0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.listSchedule.timeLine.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildCarousel(context, index, changeActive, onActive);
                },
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _addItem(context);
                    },
                    icon: Icon(Icons.add),
                    style:
                        ButtonStyle(iconSize: MaterialStateProperty.all(34)),
                    color: AppColor.darkPrimaryColor,
                  ),
                ],
              )),
              SizedBox(
                height: height - 300,
                width: double.infinity,
                child: ListView.builder(
                          itemCount: currentDaySchedule.itemsActivity.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(height: 10),
                                Theme(
                                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                                  child: ExpansionTile(
                                      collapsedBackgroundColor: AppColor.lightColor1,
                                      title: Text(currentDaySchedule.itemsActivity[index].name),
                                      backgroundColor: AppColor.lightColor2,
                                      children: <Widget>[
                                        ListAcitivyRender(currentDaySchedule.itemsActivity[index])
                                      ],
                                    ),
                                )
                              ],
                            );
                          }),
              ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 70,
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                createSchedule();
              },
              child: const Text("Create", style: AppText.textBlack)),
        ),
      ),
    );
  }
}

class ListAcitivyRender extends StatefulWidget {
  ListAcitivyRender(
    this.data, {
    super.key,
  });
  late ActivitySchedule data;

  @override
  State<ListAcitivyRender> createState() => _ListAcitivyRenderState();
}

class _ListAcitivyRenderState extends State<ListAcitivyRender> {
  String type = 'startTime';
  bool isActive = false;

  void addTimer(int hour, int minutes) {
    List<Time> items = TimerBloc.instance.state.list;
    int id = 0;
    for (var element in items) {
      if (hour == element.hour && minutes == element.minutes) {
        id = int.parse(element.id);
        break;
      }
    }
    setState(() {
      if (type == 'startTime') {
        widget.data.startTime = id;
      } else {
        widget.data.endTime = id;
      }
    });
  }

  void openDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => TimerDialog(context, addTimer));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              openDialog(context);
              setState(() {
                type = 'startTime';
              });
            },
            child: Text(
              widget.data.startTime >= 0
                  ? 'Thời gian bắt đầu: ${widget.data.startTime.toString()}'
                  : 'change ST',
              style: TextStyle(fontSize: 10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                openDialog(context);
                setState(() {
                  type = 'ednTime';
                });
              },
              child: Text(
                  widget.data.endTime >= 0
                      ? 'Thời gian kết thúc: ${widget.data.endTime.toString()}'
                      : 'change ET',
                  style: TextStyle(fontSize: 10)))
        ],
      ),
    );
  }
}

class BuildCarousel extends StatelessWidget {
  BuildContext context;
  int carouselIndex;
  void Function(int) changeActive;
  int onActive;

  BuildCarousel(
      this.context, this.carouselIndex, this.changeActive, this.onActive,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ElevatedButton(
          child: Text(
            "day ${carouselIndex + 1}",
          ),
          style: ElevatedButton.styleFrom(
              side: BorderSide(
            width: 1.0,
            color: carouselIndex == onActive
                ? AppColor.blackColor1
                : AppColor.borderColor,
          )),
          onPressed: () {
            changeActive(carouselIndex);
          },
        ));
  }
}
