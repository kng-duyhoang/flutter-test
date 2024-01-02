import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/authorize/index.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/activity/index.dart';
import 'package:healthy_app/model/authorize/index.dart';
import 'package:healthy_app/model/schedule/index.dart';
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
      builder: (BuildContext context) => AddActivityDialog(context, addActivity)
    );
  }

  void addActivity(ActivitySchedule dataResponse) {
    final ActivitySchedule data = ActivitySchedule(endTime: 2, activity: dataResponse.activity, startTime: 1, name: dataResponse.name, itemsSubActivity: []);
    setState(() {
      widget.listSchedule.timeLine[onActive].itemsActivity.add(data);
    });
    changeActive(onActive);
  }

  void createSchedule() async {
    final response = await ScheduleApi().createSchedule(widget.listSchedule);

    print(response);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(vertical: 16.0),
                scrollDirection: Axis.horizontal,
                itemCount: widget.listSchedule.timeLine.length,
                itemBuilder: (BuildContext context, int index) {
                  return BuildCarousel(context, index, changeActive, onActive);
                },
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          _addItem(context);
                        },
                        icon: Icon(Icons.add),
                        style: ButtonStyle(
                            iconSize: MaterialStateProperty.all(34)),
                        color: AppColor.darkPrimaryColor,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: currentDaySchedule.itemsActivity.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListAcitivyRender(currentDaySchedule.itemsActivity[index].name);
                        }
                                            ),
                      ),
                    ]),
              ),
            )
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

class ListAcitivyRender extends StatelessWidget {
  ListAcitivyRender(this.name, {
    super.key,
  });
  late String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        child: Text(name),
        onPressed: () {
        },
      )
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
