import 'package:flutter/material.dart';
import 'package:healthy_app/apis/schedule/index.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/response.dart';
import 'package:healthy_app/router/index.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScheduleList extends StatefulWidget {
  const ScheduleList({required this.label ,super.key});
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
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.label, style: AppText.titleLarge),
                  TextButton(
                    onPressed: () {
                    },
                    child: const Text(
                      'See more',
                      style: AppText.textSecondary,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 170,
                width: double.infinity,
                child: isLoading
                    ? LoadingAnimationWidget.newtonCradle(
                        color: AppColor.lightPrimaryColor,
                        size: 100,
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: listRender.length,
                        itemBuilder: (context, index) => ScheduleDemoCard(
                              index: index,
                              isLast: (index + 1) == listRender.length,
                              data: listRender[index],
                            ))),
          ],
        ),
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailSchedule, arguments: data.id);
      },
      child: Card(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.only(right: isLast ? 0 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 172,
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
              style: AppText.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
