import 'package:flutter/material.dart';
import 'package:healthy_app/model/schedule/index.dart';

class ScheduleDayDetail extends StatefulWidget {
  ScheduleDayDetail({required this.daySchedule, required this.changeIndex, super.key});
  DaySchedule daySchedule;
  Function changeIndex;
  @override
  State<ScheduleDayDetail> createState() => _ScheduleDayDetailState();
}

class _ScheduleDayDetailState extends State<ScheduleDayDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              widget.changeIndex(0);
            },
          ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: widget.daySchedule.itemsActivity.length,
          itemBuilder: (context, index) => Text(widget.daySchedule.itemsActivity[index].name),
        ),
      ),
    );
  }
}
