import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  shadowColor: Colors.transparent,
  primaryColor: appColor.primaryColor,
  dialogBackgroundColor: AppColors.appBkWhite,
  scaffoldBackgroundColor: AppColors.appBKWhite150,
  dividerColor: appColor.grey,
  disabledColor: Colors.white,
  iconTheme: const IconThemeData(color: AppColors.appBkGreen200),
  canvasColor: AppColors.appBkWhite,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearTrackColor: AppColors.appBkGreen300,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: appColor.primaryColor,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: AppColors.appBkWhite,
    unselectedLabelColor: AppColors.appBkBlack200,
    labelStyle: const TextStyle().copyWith(
      color: AppColors.appBkGrey300,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Creates border
        color: AppColors.spaceAppWhite100,
        gradient: AppColors.buttonGradient,
        boxShadow: const [
          BoxShadow(
              blurRadius: 23,
              spreadRadius: 0,
              color: AppColors.appBkGrey100,
              offset: Offset(0, 0))
        ]),
    unselectedLabelStyle: const TextStyle().copyWith(
      color: AppColors.appBkWhite,
      fontWeight: FontWeight.w700,
      fontSize: 12,
    ),
  ),
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade200,
      filled: true,
    ),
    textStyle: AppTextStyle.b2,
  ),
  scrollbarTheme: ScrollbarThemeData(
    interactive: true,
    thumbVisibility: WidgetStateProperty.all(true),
    radius: const Radius.circular(2.0),
    thumbColor: WidgetStateProperty.all(
      appColor.primaryColor,
    ),
    trackColor: WidgetStateProperty.all(
      AppColors.appBkGrey300,
    ),
    thickness: WidgetStateProperty.all(6.0),
    minThumbLength: 100,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.appBkWhite,
    filled: true,
    errorMaxLines: 2,
    errorStyle: const TextStyle(
      letterSpacing: -0.4,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: AppColors.appBkGrey300,
        width: 1.w,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: appColor.primaryColor,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: appColor.red,
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(8.r),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: appColor.primaryColor,
        width: 1.w,
      ),
    ),
    contentPadding: const EdgeInsets.all(12),
    hintStyle: const TextStyle().copyWith(
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.appBkGrey300,
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Inter',
  appBarTheme: AppBarTheme(
    // backgroundColor: AppColors.appBkWhite,
    surfaceTintColor: Colors.transparent,
    // elevation: 0.5,

    systemOverlayStyle: SystemStyles.light,
    color: AppColors.appBkWhite,
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    headlineLarge: AppTextStyle.h1,
    headlineMedium: AppTextStyle.h2,
    headlineSmall: AppTextStyle.h3,
    titleLarge: AppTextStyle.h4,

    //
    bodyLarge: AppTextStyle.b1,
    bodyMedium: AppTextStyle.b2,
    bodySmall: AppTextStyle.b3,

    //
    displayLarge: AppTextStyle.l1,
    displayMedium: AppTextStyle.l2,
    displaySmall: AppTextStyle.l3,

    titleSmall: AppTextStyle.l3,
  ),
  buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.appBkBlack250,
      colorScheme: ColorScheme.dark(),
      disabledColor: AppColors.appBkBlack200),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.appBkWhite,
      selectedItemColor: appColor.primaryColor,
      unselectedItemColor: AppColors.appBkGrey300,
      selectedIconTheme: IconThemeData(
        color: appColor.primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: appColor.grey,
      )),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(
      appColor.primaryColor,
    ),
    checkColor: WidgetStateProperty.all(AppColors.appBkWhite),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
    ),
    side: AlwaysActiveBorderSide(),
  ),
  colorScheme: const ColorScheme.dark(),
);

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class AlwaysActiveBorderSide extends WidgetStateBorderSide {
  @override
  BorderSide? resolve(states) => BorderSide(
        color: appColor.primaryColor,
        width: 1,
      );
}
