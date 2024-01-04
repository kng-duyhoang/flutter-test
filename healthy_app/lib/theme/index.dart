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
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: Theme.of(context)
          .textTheme
          .apply(
            fontFamily: 'HiraginoSans',
            bodyColor: Colors.black.withOpacity(0.7),
          )
          .copyWith(
            titleLarge: AppText.titleLarge,
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
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          fontFamily: 'HiraginoSans',
          bodyColor: Colors.black.withOpacity(0.7),
        )
        .copyWith(
          titleLarge: AppText.titleLarge,
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
