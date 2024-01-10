import 'package:flutter/material.dart';

import 'package:healthy_app/constant/color.dart';
import 'package:healthy_app/constant/text.dart';

ThemeData defaultTheme(BuildContext context, {String? type = 'light'}) {
  if (type != 'light') {
    return ThemeData.dark().copyWith(
      primaryColor: AppColor.darkPrimaryColor,
      primaryColorLight: AppColor.darkPrimaryColor,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColor.darkPrimaryColor,
        secondary: AppColor.lightSecondColor,
        background: AppColor.darkPrimaryColor
      ),
      scaffoldBackgroundColor: AppColor.darkPrimaryColor,
      iconTheme: Theme.of(context)
        .iconTheme
        .copyWith(
          color: AppColor.iconDarkColor,
        )
      ,
      textTheme: Theme.of(context)
          .textTheme
          .apply(
            fontFamily: 'HiraginoSans',
            bodyColor: AppColor.lightColor1,
          )
          .copyWith(
            titleLarge: AppText.titleLargeDark,
            titleMedium: AppText.titleMedium,
            titleSmall: AppText.titleSmall,
            bodyLarge: AppText.bodyLarge,
            bodyMedium: AppText.bodyMedium,
            bodySmall: AppText.bodySmall,
          ),
    );
  }

  return ThemeData.light().copyWith(
    primaryColor: AppColor.lightPrimaryColor,
    primaryColorLight: AppColor.lightPrimaryColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColor.lightPrimaryColor,
      secondary: AppColor.lightSecondColor,
      background: AppColor.white1,
    ),
    scaffoldBackgroundColor: Colors.white,
     iconTheme: Theme.of(context)
        .iconTheme
        .copyWith(
          color: AppColor.iconLightColor
        )
      ,
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          fontFamily: 'HiraginoSans',
          bodyColor: AppColor.darkPrimaryColor,
        )
        .copyWith(
          titleLarge: AppText.titleLargeLight,
          titleMedium: AppText.titleMedium,
          titleSmall: AppText.titleSmall,
          bodyLarge: AppText.bodyLarge,
          bodyMedium: AppText.bodyMedium,
          bodySmall: AppText.bodySmall,
        ),
    outlinedButtonTheme: _buildOutlinedButtonTheme(),
  );
}

_buildOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      side: const BorderSide(
        style: BorderStyle.solid,
        width: 1,
        color: AppColor.lightColor2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
