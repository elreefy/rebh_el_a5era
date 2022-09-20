import 'package:flutter/material.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';
import 'app_size.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //floated button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyColors.floatedButtonColor,
      foregroundColor: Colors.white,
    ),
    //bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.bottomNavBarColor,
      selectedItemColor: MyColors.textColor,
      unselectedItemColor: MyColors.textColor,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: getBoldStyle(
        color: MyColors.textColor,
        fontSize: FontSizeManager.s16,
      ),
      unselectedLabelStyle: getBoldStyle(
        color: MyColors.textColor,
        fontSize: FontSizeManager.s16,
      ),
    ),
    //Scaffold background color
    scaffoldBackgroundColor: MyColors.background,
    //appbar color
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: MyColors.kWhiteColor),
      titleTextStyle: getBoldStyle(
          color: MyColors.textColor, fontSize: FontSizeManager.s22),
    ),
    //*  main Colors
    primaryColor: MyColors.background,
    primaryColorLight: MyColors.background,
    primaryColorDark:MyColors.background,
   // disabledColor: MyColors.white,
   // splashColor: MyColors.white,

    //*  Card View theme

  //  cardTheme: CardTheme(
 //     color: MyColors.white,
 //     shadowColor: MyColors.grey,
  //    elevation: AppSize.s4,
   // ),

    //*  button theme
    // buttonTheme: ButtonThemeData(
    //   shape: const StadiumBorder(),
    //   disabledColor: MyColors.grey1,
    //   buttonColor: MyColors.primary,
    //   splashColor: MyColors.white,
    // ),
    //* elevation Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: Colors.white, fontSize: FontSizeManager.s12),
        primary: MyColors.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    //*  text theme
    textTheme: TextTheme(
      displayMedium: getMediumStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s22),
      displayLarge: getSemiBoldStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s22),
      headlineSmall: getSemiBoldStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s18),
      //* appBarTitle
      headlineMedium: getMediumStyle(
          color: MyColors.textColor, fontSize: FontSizeManager.s20),
      //* bag title
      headlineLarge: getSemiBoldStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s22),
      //* smoll text
      titleSmall: getRegularStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s18),
      titleMedium: getMediumStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s20),
      titleLarge: getSemiBoldStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s22),
      //* bag text
      bodySmall: getRegularStyle(color: MyColors.kWhiteColor),
      bodyMedium: getMediumStyle(color: MyColors.kWhiteColor),
      bodyLarge: getSemiBoldStyle(
          color: MyColors.kWhiteColor, fontSize: FontSizeManager.s14),
    ),
  );
}
