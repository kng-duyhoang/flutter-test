// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/response.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({required this.label, super.key});
  final String label;

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  List<DayScheduleResponse> listRender = [];

  bool isLoading = false;

  void getListSchedule() async {
    setState(() {
      isLoading = true;
    });
    final response = await ScheduleApi().getSchedule();
    if (response.items.isNotEmpty) {
      setState(() {
        listRender = response.items;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getListSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child: Text(widget.label, style: AppText.titleLargeLight),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: isLoading
                ? LoadingAnimationWidget.newtonCradle(
                    color: AppColor.lightPrimaryColor,
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
                style: AppText.titleLargeLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
