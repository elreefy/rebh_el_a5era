import 'package:flutter/material.dart';

class MyColors {
  //save #081945 in static variable background color
  static Color background = Color(0xff081945);
  //#DC8B18 in variable iconColor
  static Color iconColor = Color(0xffDC8B18);
  //843BB9 in variable text color
  static Color textColor = Color(0xff843BB9);
//14234C in variable text container text color
  static Color containerTextColor = Color(0xff14234C);
  static Color bottomNavBarColor = Color(0xff162451);
  static Color floatedButtonColor = Color(0xff8A38BE);
  static Color starTextColor = Color(0xffAC7224);


  static var rightPause = Color(0xff55234F);
  static var centerPause = Color(0xff672748);
  static var leftPause  = Color(0xff983162);

  static var rightPlay  = Color(0xff45636B);
  static var centerPlay = Color(0xff465372);
  static var leftPlay   = Color(0xff3C4176);


  static var secondary = Color(0xff262c3a);
  static var dark = Color(0xFF8D8E98);
  static var darkness = Color(0xffbdbdbd);
  static var redAccent = Color(0xffff0059);
  static const Color kPinkColor = Color(0xFFFE53BB);
  static const Color kCyanColor = Color(0xFF08F7FE);
  static const Color kGreenColor = Color(0xFF09FBD3);
  static const Color kWhiteColor = Color(0xFFFFFFFF);
  static const Color kBlackColor = Color(0xFF19191B);
  static const Color kYellowColor = Color(0xFFF2A33A);
  static const Color kGreyColor = Color(0xFF767680);
  static const Color light = Color(0xFFF2F2F2);

  static Map<int, Color> swatch = {
    50: const Color(0x1Ae6aa29), //10%
    100: const Color(0x33e6aa29), //20%
    200: const Color(0x4De6aa29), //30%
    300: const Color(0x66e6aa29), //40%
    400: const Color(0x80e6aa29), //50%
    500: const Color(0x99e6aa29), //60%
    600: const Color(0xBFe6aa29), //70%
    700: const Color(0xCCe6aa29), //80%
    800: const Color(0xE6e6aa29), //90%
    900: const Color(0xffe6aa29), //100%
  };

  static MaterialColor primaryColor = MaterialColor(0xFFFFFFFF, swatch);
}
