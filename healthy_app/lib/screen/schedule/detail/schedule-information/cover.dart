// ignore_for_file: unnecessary_const, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:healthy_app/constant/color.dart';

class CoverDetail extends StatelessWidget {
  CoverDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 300,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              IconButton.filled(
                color: AppColor.lightPrimaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: AppColor.white1,)),
              const SizedBox(width: 50),
              const Text('Schedule Detail',
                  style: TextStyle(
                      color: AppColor.white1,
                      fontSize: 24,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    ]);
  }
}
