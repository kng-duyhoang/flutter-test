import 'package:flutter/material.dart';

const primaryColor = Colors.purpleAccent;
const primaryColorLight = Colors.blueGrey;
const textColorLight = Color.fromRGBO(118, 118, 118, 1);
const textColorDark = Colors.purpleAccent;

const primaryGradientColors = [
  Color(0xffe8ecf9),
  Color(0xfff0dff5),
  Color(0xfffdf6e3),
];
const secondaryGradientColors = [
  Color(0xffe7f1f9),
  Color(0xffeddef6),
];
const disabledGradientColors = [
  Color(0xffE8E8E8),
  Color(0xffE8E8E8),
  Color(0xffE8E8E8),
];
const buttonGradientColors = [
  Color(0xFFB06DCC),
  Color(0xFF0101EE),
];

const primaryGradient = LinearGradient(
  colors: primaryGradientColors,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const secondaryGradient = LinearGradient(
  colors: secondaryGradientColors,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const disabledGradient = LinearGradient(
  colors: disabledGradientColors,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
var buttonGradient = LinearGradient(
  colors: [buttonGradientColors[0].withOpacity(0.7), buttonGradientColors[1].withOpacity(0.3)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: const [0.4, 1],
);
var backgroundTextGradient = LinearGradient(
  colors: [
    buttonGradientColors[1].withOpacity(0.08),
    buttonGradientColors[0].withOpacity(0.3),
  ],
);
var backgroundTitleGradient = const LinearGradient(
  colors: [Color.fromARGB(255, 229, 208, 239), Color.fromARGB(255, 244, 229, 220)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

ThemeData defaultTheme(context) {
  return ThemeData.light().copyWith(
    textTheme: Theme.of(context).textTheme.apply(
      fontFamily: 'HiraginoSans', bodyColor: Colors.black.withOpacity(0.7),
    ).copyWith(
      bodyMedium: const TextStyle(color: textColorLight, fontWeight: FontWeight.w300, fontSize: 14),
      bodyLarge: const TextStyle(color: textColorDark, fontWeight: FontWeight.w600, fontSize: 16),
      labelMedium: const TextStyle(color: textColorLight, fontWeight: FontWeight.w300, fontSize: 14),
      labelLarge: const TextStyle(color: textColorDark, fontWeight: FontWeight.w300, fontSize: 14),
      headlineMedium: const TextStyle(color: textColorLight, fontWeight: FontWeight.w300, fontSize: 24),
    ),
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
    ),
    outlinedButtonTheme: _buildOutlinedButtonTheme(),
    inputDecorationTheme: _buildInputDecorationTheme(),
  );
}

_buildInputDecorationTheme() {
  return InputDecorationTheme(
    isDense: true,
    alignLabelWithHint: true,
    contentPadding: const EdgeInsets.all(16),
    enabledBorder: _buildBorder(Colors.grey.shade300),
    errorBorder: _buildBorder(Colors.red.shade800),
    focusedErrorBorder: _buildBorder(Colors.red.shade800),
    focusedBorder: _buildBorder(Colors.black.withOpacity(0.7)),
    disabledBorder: _buildBorder(Colors.grey.shade200),
  );
}

_buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: color, width: 2),
  );
}

_buildOutlinedButtonTheme() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(width: 1, color: Colors.black),
      ),
    ),
  );
}
