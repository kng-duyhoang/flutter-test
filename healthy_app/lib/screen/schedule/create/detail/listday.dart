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
                style: AppText.titleMedium,
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
            ),
            SizedBox(
              width: 10,
            )
          ],
        ));
  }
}