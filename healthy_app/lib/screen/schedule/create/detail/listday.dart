// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

class ListDay extends StatelessWidget {
  BuildContext context;
  int carouselIndex;
  void Function(int) changeActive;
  int onActive;

  ListDay(
      this.context, this.carouselIndex, this.changeActive, this.onActive,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          children: [
            ElevatedButton(
              
              child: Text(
                "Ngày  ${carouselIndex + 1}",
                style: AppText.textWhite,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: carouselIndex == onActive
                    ? AppColor.lightPrimaryColor
                    : AppColor.lightSecondColor,
              ),
              onPressed: () {
                changeActive(carouselIndex);
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ));
  }
}
