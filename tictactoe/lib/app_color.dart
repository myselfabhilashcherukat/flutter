import 'package:flutter/material.dart';

class AppThemes {
  static const primaryPink = Color(0xffFF0080);
  static const backgroundWhite = Color.fromARGB(255, 194, 194, 194);
  static const backgroundBlue = Color.fromARGB(255, 94, 81, 235);
  static const cardWhite = Color(0xffFFFFFF);
  static const appBlack = Color(0xff000000);

  static const double textLabelVerySmall = 5.0;
  static const double textLabelSmall = 8.0;
  static const double textLabelNormal = 11.0;
  static const double textLabelLarge = 20.0;

  static const TextStyle styleAppbarTitle = TextStyle(
    fontSize: textLabelLarge,
    fontWeight: FontWeight.bold,
    color: backgroundBlue,
  );
  static const TextStyle styleAppbarSubTitle = TextStyle(
    fontSize: textLabelNormal,
    fontWeight: FontWeight.bold,
    color: AppThemes.appBlack,
  );

  AppThemes._();
}
