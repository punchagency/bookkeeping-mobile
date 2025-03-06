import 'dart:io';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final color = AppColors();

class AppTextStyle {
  static final h1 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 32.sp,
    letterSpacing: 0.9,
    fontWeight: FontWeight.w700,
    color: AppColors.appBkGrey800,
  );

//Second header
  static final h2 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -2,
    color: AppColors.appBkGrey800,
  );

//third header
  static final h3 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.9,
    color: AppColors.appBkGrey800,
  );
  static final l1 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.9,
    color: AppColors.appBkGrey800,
  );

  static final h4 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.9,
    color: AppColors.appBkGrey800,
  );

//
  static final l2 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.9,
    color: AppColors.appBkGrey800,
  );

  //
  static final l3 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.9,
    color: AppColors.appBkGrey800,
  );

  ///
  //

  static final l4 = TextStyle(
    fontFamily: "BricolageGrotesque",
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.9,
    color: AppColors.appBkGrey800,
  );

  //
  //
  /// default font size here is 20.sp
  ///

  static final b1 = TextStyle(
    fontFamily: "Satoshi",
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.appBkGrey800,
  );

//
  static final b2 = TextStyle(
    fontFamily: "Satoshi",
    fontSize: 14.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.appBkGrey800,
  );

  static final b3 = TextStyle(
    fontFamily: "Satoshi",
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.appBkGrey800,
  );

  static final b4 = TextStyle(
    fontFamily: "Satoshi",
    fontSize: 10.sp,
    fontWeight: FontWeight.w900,
    color: AppColors.appBkGrey800,
  );

  //
  /// default font size here is 17.sp
}

class SystemStyles {
  static final SystemUiOverlayStyle light = Platform.isIOS
      ? SystemUiOverlayStyle(
          statusBarColor: AppColors.appBkBlack.withOpacity(.2),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : SystemUiOverlayStyle(
          statusBarColor: AppColors.appBkBlack.withOpacity(.2),
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle dark = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);
}
