import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';
import 'package:healthy_app/model/schedule/index.dart';

class SubActivityBlock extends StatelessWidget {
  SubActivityBlock({
    super.key,
    required this.data,
  });

  final SubActivitySchedule data;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.lightPrimaryColor,
            width: 1.5
          ),
          color: AppColor.lightPrimaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data.name,
            style: AppText.textWhite,
          ),
        ));
  }
}