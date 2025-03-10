import 'package:flutter/material.dart';

final appColor = AppColors();

class AppColors {
  static AppColors? _instance;

  factory AppColors() {
    return _instance ??= AppColors._internal();
  }

  AppColors._internal();

//General
  final primaryColor = const Color(0xff01CD22);
  final secondaryColor = const Color(0xFFFF7F11);
  final grey = const Color(0xFF222829);

//
//
  final blackBold = const Color(0xFF343A40);
  final orangeBeginGrad = const Color(0xffFF5041);
  final red = const Color(0xffF22E52);

  //
  final lightGrey3 = const Color(0xFF6C6C6C);
  final lightGrey4 = const Color(0xFFB8BBD4);
  final green = const Color(0xFF38B000);
  final black = const Color(0xFF000000);
  final themeColor = const Color(0xFF31B60E);
  final phoneColor = const Color(0xFF8E8E8E);

  final transparent = const Color(0xD8010101);
  final shadowGrey = const Color(0x232F2F2F);
  final success = const Color(0xFF43C084);
  final blue = const Color(0xFF379BF6);
  final offWhite = const Color(0xFFF7F7F7);
  final white = const Color(0xFFFFFFFF);
  final formError = Colors.red.shade400;
  final yellow = const Color(0xFFF2C364);
  final backgroundYellow = const Color(0xFFFFF2DB);
  final bottomSheetPillColor = const Color(0xFFE6E6E6);
  final borderColor = const Color(0xFFEFECF0);
  final faintGrey = const Color(0xFF929292);
  final filterByBorderColor = const Color(0xFFEDEDED);
  final redColor = const Color(0xFFF22E52);
  final menuBackgroundColor = const Color(0xFFFDFBFF);
  final blackNoName = const Color(0xFF121212);
  final passwordCheckBg = const Color(0xFFFDFBFF);
  final passwordConditions = const Color(0xFF222222);
  final activateDeactivateUssdBackgroundColor = const Color(0xFFFFD7DE);
  final cardVariantColor = const Color(0xFFFAF4FF);
  final textBlackColor = const Color(0xFF1D1A19);

  final smallGradient = const LinearGradient(
      begin: Alignment(-0.9449995756149292, -1.0066247582435608),
      end: Alignment(-1.10259151458740234, 0.8449995756149292),
      // stops: [0.1,0.4,0.5],
      colors: [
        appBkGreen200,
        appBkGreen500,
      ]);

  final primaryGradient = const LinearGradient(
      begin: Alignment(-0.9449995756149292, -1.0066247582435608),
      end: Alignment(-1.10259151458740234, 0.8449995756149292),
      colors: [
        appBkGreen800,
        appBkGreen400,
      ]);

  final secondaryGradient = const LinearGradient(
      begin: Alignment(-0.3, -1),
      end: Alignment(-0.9, 6),
      colors: [
        appBkYellow200,
        appBkYellow500,
      ]);

  /// The spaceApp Green Color
  static const Color appBkGreen50 = Color(0xFFE6FAE9);
  static const Color appBkGreen100 = Color(0xFFCCF5D3);
  static const Color appBkGreen200 = Color(0xFFB3F0BD);
  static const Color appBkGreen300 = Color(0xFF99EBA7);
  static const Color appBkGreen400 = Color(0xFF67E17A);
  static const Color appBkGreen500 = Color(0xFF34D74E);
  static const Color appBkGreen600 = Color(0xFF01CD22);
  static const Color appBkGreen700 = Color(0xFF01A41B);
  static const Color appBkGreen800 = Color(0xFF017B14);
  static const Color appBkGreen900 = Color(0xFF00520E);
  static const Color appBkGreen950 = Color(0xFF003E0A);
  static const Color elmerGreen = Color(0xFF3BA297);

  /// The united lagos yellow color
  static const Color appBkYellow50 = Color(0xFFFFFBE6);
  static const Color appBkYellow100 = Color(0xFFFFF6CC);
  static const Color appBkYellow200 = Color(0xFFFFF0B3);
  static const Color appBkYellow300 = Color(0xFFFEEF99);
  static const Color appBkYellow400 = Color(0xFFFEE866);
  static const Color appBkYellow500 = Color(0xFFFEF10F);
  static const Color appBkYellow600 = Color(0xFFE6D60D);
  static const Color appBkYellow700 = Color(0xFFCCBB0C);
  static const Color appBkYellow800 = Color(0xFFB3A00A);
  static const Color appBkYellow900 = Color(0xFF998509);
  static const Color appBkYellow950 = Color(0xFF665805);

  /// The spaceApp red Color
  static const Color appBkRed50 = Color(0xFFFFE6E6);
  static const Color appBkRed100 = Color(0xFFFFCCCC);
  static const Color appBkRed200 = Color(0xFFFFB3B3);
  static const Color appBkRed300 = Color(0xFFFF9999);
  static const Color appBkRed400 = Color(0xFFFF6666);
  static const Color appBkRed500 = Color(0xFFF10000);
  static const Color appBkRed600 = Color(0xFFD90000);
  static const Color appBkRed700 = Color(0xFFB80000);
  static const Color appBkRed800 = Color(0xFF960000);
  static const Color appBkRed900 = Color(0xFF730000);
  static const Color appBkRed950 = Color(0xFF520000);

  /// The spaceApp Black
  static const Color appBkBlack = Color(0xFF000000);
  static const Color appBlackBG = Color(0xFF222829);
  static const Color appBkBlackappBar = Color(0xff343A40);
  static const Color appBlack500 = Color(0xFF161616);
  static const Color appBkBlack200 = Color(0xFF2F2F2F);
  static const Color appBkBlack150 = Color(0xFF6D6C6C);
  static const Color appBKBlack100 = Color(0xFF4F4F4F);
  static const Color appBkBlack50 = Color(0xFF4B4B4B);
  static const Color appBkBlack250 = Color(0xFF343A40);
  static const Color appBkBlac350 = Color(0xFF6C757D);
  static const Color appBkBlac4950 = Color(0xFF495057);
  static const Color appBkBlack51 = Color(0xFFD9D9D9);
  static const Color appBkBlack52 = Color(0xFF8E8E8E);

  /// the united lagos blue color
  static const Color appBkBlue50 = Color(0xFFE6E6FF);
  static const Color appBkBlue100 = Color(0xFFCCCCFF);
  static const Color appBkBlue200 = Color(0xFFB3B3FF);
  static const Color appBkBlue300 = Color(0xFF9999FF);
  static const Color appBkBlue400 = Color(0xFF6666FF);
  static const Color appBkBlue500 = Color(0xFF0102FF); // Base blue
  static const Color appBkBlue600 = Color(0xFF0002E6);
  static const Color appBkBlue700 = Color(0xFF0002CC);
  static const Color appBkBlue800 = Color(0xFF0002B3);
  static const Color appBkBlue900 = Color(0xFF000299);
  static const Color appBkBlue950 = Color(0xFF000266);

  /// The spaceAppernative Grey
  static const Color appBkGrey25 = Color(0xFFEFF2F2);
  static const Color appBkGrey50 = Color(0xFFEEF0F0);
  static const Color appBkGrey100 = Color(0xFFDDE0E1);
  static const Color appBkGrey200 = Color(0xffBBC1C2);
  static const Color appBkGrey300 = Color(0xFF9AA3A4);
  static const Color appBkGrey400 = Color(0xff788485);
  static const Color appBkGrey500 = Color(0xFF566567);
  static const Color appBkGrey600 = Color(0xFF455152);
  static const Color appBkGrey700 = Color(0xff343D3E);
  static const Color appBkGrey800 = Color(0xff222829);
  static const Color appBkGrey900 = Color(0xff111415);
  static const Color appBkGrey950 = Color(0xff090A0A);

  /// The spaceApp White Color
  static const Color appBkWhite = Colors.white;
  static const Color appBKWhite150 = Color(0XFFF9F9F9);
  static const Color spaceAppWhite100 = Color(0xFFEAEDF3);
  static const Color spaceAppWhite50 = Color(0xFFFAFAFA);

  ///
  ///
  static const Color spaceAppDash1 = Color(0xffFFF4E0);
  static const Color spaceAppDash2 = Color(0xffFFEBFA);
  static const Color spaceAppDash3 = Color(0xffF0F5FF);
  static const Color spaceAppDash4 = Color(0xffECFFEB);
  static const Color spaceAppDash5 = Color(0xffE0F7F3);
  static const Color spaceAppDash6 = Color(0xffF6F0FF);
  static const Color spaceAppDash7 = Color(0xffF6F0FF);
  static const Color spaceAppDash8 = Color(0xffFFF0F0);

  /// The spaceApp Gradient

  static BoxShadow spaceAppGreyShadow = const BoxShadow(
    color: AppColors.appBkGrey400,
    offset: Offset(0, 4),
    blurRadius: 10,
    spreadRadius: 2,
  );

  static LinearGradient buttonGradient = const LinearGradient(
    colors: [
      AppColors.appBkGreen100,
      AppColors.appBkGreen900,
    ],
  );

  static const Color backgroundColor = Color(0xFFFFFFFF); // White
  static const Color lightGrayBackground = Color(0xFFF5F5F5); // Light Gray

  // Text Colors
  static const Color primaryText = Color(0xFF000000); // Black
  static const Color secondaryText = Color(0xFF333333); // Dark Gray
  static const Color hintText = Color(0xFF666666); // Gray
  static const Color lightHintText = Color(0xFF999999); // Light Gray

  // Button Colors
  static const Color primaryButton = Color(0xFF2196F3); // Material Blue
  static const Color secondaryButton = Color(0xFF4CAF50); // Material Green

  // Border Colors
  static const Color inputBorder = Color(0xFFCCCCCC);
}
