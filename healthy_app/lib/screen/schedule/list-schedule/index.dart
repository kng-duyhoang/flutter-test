import 'dart:async';

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/response.dart';
import 'package:healthy_app/router/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScheduleList(label: 'Your Schedule')
        ],
      ),
    );
  }
}

class ScheduleList extends StatefulWidget {
  const ScheduleList({required this.label, super.key});
  final String label;

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List<DayScheduleResponse> listRender = [];
  late Completer<void> _getListScheduleCompleter;
  bool isLoading = true;

  void getListSchedule() async {
    try {
      final response = await ScheduleApi().getSchedule();
      if (!_getListScheduleCompleter.isCompleted) {
        if (response.items.isNotEmpty) {
          setState(() {
            listRender = response.items;
            isLoading = false;
          });
        }
        _getListScheduleCompleter.complete();
      }
    } catch (error) {
      // 
    }
  }

  @override
  void initState() {
    super.initState();
    _getListScheduleCompleter = Completer<void>();
    getListSchedule();
  }

  @override
  void dispose() {
    if (!_getListScheduleCompleter.isCompleted) {
      _getListScheduleCompleter.completeError("Operation canceled");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.createSchedule);
                    }, 
                    icon: Icon(Icons.add, color: Theme.of(context).colorScheme.onBackground), 
                    label: Text('Add', style: Theme.of(context).textTheme.titleMedium,),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(widget.label, style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: isLoading
                ? LoadingAnimationWidget.newtonCradle(
                    color: Theme.of(context).colorScheme.background,
                    size: 100,
                  )
                : Wrap(
                  alignment: WrapAlignment.spaceBetween,
                    children: List.generate(
                      listRender.length,
                      (index) => 
                        ScheduleDemoCard(
                          data: listRender[index],
                          index: index,
                          isLast: (index + 1) == listRender.length
                        )
                    )
                  ),
          )
        ]),
      ),
    );
  }
}

class ScheduleDemoCard extends StatelessWidget {
  const ScheduleDemoCard(
      {super.key,
      required this.index,
      required this.data,
      required this.isLast});

  final int index;
  final bool isLast;
  final DayScheduleResponse data;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // print(data.id);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SizedBox(
          width: (screenWidth - 48)/2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  height: 128,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent),
                  child: Image.asset(
                    'assets/images/demo-0${index % 3 + 1}.jpg',
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 10),
              Text(
                data.nameSchedule,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
