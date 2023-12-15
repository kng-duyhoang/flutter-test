import 'package:flutter/material.dart';

import 'package:healthy_app/constant/color.dart';

class AppText {
  static const titleLarge = TextStyle(
    fontSize: 22,
    color: AppColor.lightPrimaryColor,
    fontWeight: FontWeight.bold,
  );
  static const titleMedium = TextStyle(
    fontSize: 18,
    color: AppColor.lightSecondColor,
    fontWeight: FontWeight.w500,
  );
  static const titleSmall = TextStyle(
    fontSize: 14,
    color: AppColor.lightColor1,
    fontWeight: FontWeight.normal,
  );
  static const bodyLarge = TextStyle(
    fontSize: 22,
    color: AppColor.lightColor2,
    fontWeight: FontWeight.bold,
  );
  static const bodyMedium = TextStyle(
    fontSize: 18,
    color: AppColor.lightColor3,
    fontWeight: FontWeight.w500,
  );
  static const bodySmall = TextStyle(
    fontSize: 14,
    color: AppColor.lightColor4,
    fontWeight: FontWeight.normal,
  );
}
