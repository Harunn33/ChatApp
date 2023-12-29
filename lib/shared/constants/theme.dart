// ignore_for_file: non_constant_identifier_names

import 'package:chat_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.ZHEN_ZHU_BAI_PEARL,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.ZHEN_ZHU_BAI_PEARL,
      titleTextStyle: TextStyle(
        fontSize: 15.sp,
        color: AppColors.BLACK,
      ),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   fillColor: AppColors.WHITE,
    //   filled: true,
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: AppBorderRadius.inputRadius,
    //     borderSide: BorderSide(
    //       width: .1.w,
    //       color: AppColors.TETSU_KON_BLUE.withOpacity(.24),
    //     ),
    //   ),
    //   border: OutlineInputBorder(
    //     borderRadius: AppBorderRadius.inputRadius,
    //     borderSide: BorderSide(
    //       width: .1.w,
    //       color: AppColors.TETSU_KON_BLUE.withOpacity(.24),
    //     ),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: AppBorderRadius.inputRadius,
    //     borderSide: BorderSide(
    //       width: .1.w,
    //       color: AppColors.TETSU_KON_BLUE.withOpacity(.24),
    //     ),
    //   ),
    //   errorStyle: TextStyle(
    //     fontSize: 8.sp,
    //     fontFamily: AppFonts.medium,
    //     color: AppColors.FADED_RED,
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: AppBorderRadius.inputRadius,
    //     borderSide: BorderSide(
    //       color: AppColors.FADED_RED,
    //       width: .3.w,
    //     ),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: AppBorderRadius.inputRadius,
    //     borderSide: BorderSide(
    //       color: AppColors.FADED_RED,
    //       width: .3.w,
    //     ),
    //   ),
    // ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        color: AppColors.BLACK,
        // fontFamily: AppFonts.medium,
      ),
      // headlineMedium: TextStyle(
      //   fontFamily: AppFonts.medium,
      //   fontSize: 24,
      //   color: AppColors.ASHENVALE_NIGHTS,
      // ),
      // headlineSmall: TextStyle(
      //   fontSize: 14,
      //   fontFamily: AppFonts.medium,
      //   color: AppColors.BLACK,
      // ),
      labelLarge: TextStyle(
        fontSize: 20,
        color: AppColors.WHITE,
      ),
      // labelMedium: TextStyle(
      //   color: AppColors.BERRY_CHALK,
      //   fontSize: 15,
      //   fontFamily: AppFonts.light,
      // ),
      // labelSmall: TextStyle(
      //   fontSize: 14,
      //   fontFamily: AppFonts.regular,
      //   color: AppColors.BLACK,
      // ),
      // titleLarge: TextStyle(
      //   fontSize: 18,
      //   fontFamily: AppFonts.medium,
      //   color: AppColors.WHITE,
      // ),
      // titleMedium: TextStyle(
      //   color: AppColors.ASHENVALE_NIGHTS,
      //   fontSize: 11,
      //   fontFamily: AppFonts.medium,
      // ),
      // titleSmall: TextStyle(
      //   color: AppColors.MILLION_GREY,
      //   fontSize: 9,
      //   fontFamily: AppFonts.regular,
      // ),
    ),
  );
}
