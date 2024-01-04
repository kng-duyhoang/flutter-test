// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';
import 'package:healthy_app/screen/schedule/create/detail/listActivity.dart';
import 'package:healthy_app/screen/schedule/create/detail/listday.dart';
import 'package:healthy_app/widget/dialog/addActivity.dart';

class CreateDetailSchedule extends StatefulWidget {
  late Schedule listSchedule;
  late Function(int) goPage;

  CreateDetailSchedule(this.goPage, this.listSchedule, {super.key});

  @override
  State<CreateDetailSchedule> createState() => _CreateDetailScheduleState();
}

class _CreateDetailScheduleState extends State<CreateDetailSchedule> {
  int onActive = 0;
  int selected = -1;
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
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.listSchedule.timeLine.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListDay(context, index, changeActive, onActive);
                },
              ),
            ),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    const Text('Thêm lịch trình', style: AppText.titleLarge),
                    IconButton(
                      onPressed: () {
                        _addItem(context);
                      },
                      icon: const Icon(Icons.add),
                      style:
                          ButtonStyle(iconSize: MaterialStateProperty.all(30)),
                      color: AppColor.blackColor1,
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
                        const SizedBox(height: 10),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: AppColor.borderColor,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsets.zero,
                          child: ExpansionTile(
                            shape: const Border(),
                            collapsedBackgroundColor: Colors.transparent,
                            title: Text(
                                currentDaySchedule.itemsActivity[index].name,
                                style: AppText.textBlack),
                            backgroundColor: Colors.transparent,
                            
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




