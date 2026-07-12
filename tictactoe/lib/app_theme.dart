import 'package:flutter/material.dart';

class AppThemes {
  //COLORS
  static const primaryPink = Color(0xffFF0080);
  static const backgroundWhite = Color.fromARGB(255, 194, 194, 194);
  static const backgroundBlue = Color.fromARGB(255, 94, 81, 235);
  static const cardWhite = Color(0xffFFFFFF);
  static const backgroundBlack = Color(0xff000000);

  //TEXT SIZE
  static const double textLabelVerySmall = 5.0;
  static const double textLabelSmall = 8.0;
  static const double textLabelNormal = 11.0;
  static const double textLabelLarge = 20.0;

  //RADIUS
  static const radiusSmall = 8;
  static const radiusMedium = 16;
  static const radiusLarge = 30;

  //SPACING

  static const spacing4 = 4;
  static const spacing8 = 8;
  static const spacing12 = 12;
  static const spacing16 = 16;
  static const spacing24 = 24;
  static const spacing32 = 32;

  static const TextStyle styleAppbarTitle = TextStyle(
    fontSize: textLabelLarge,
    fontWeight: FontWeight.bold,
    color: backgroundBlue,
  );
  static const TextStyle styleAppbarSubTitle = TextStyle(
    fontSize: textLabelNormal,
    fontWeight: FontWeight.bold,
    color: backgroundBlack,
  );

  AppThemes._();
}
