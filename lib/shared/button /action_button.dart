import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmer/core/utils/colors.dart';

// ignore: must_be_immutable
class ActionButtonPrimary extends StatelessWidget {
  final String textActionName;
  final double width;
  final double height;
  void Function()? onTap;
  final Color? color;
  final Color? borderColor; // New optional border color
  final bool isActive;
  final Color? textcolor;

  final Widget? suffixIcon;

  ActionButtonPrimary({
    super.key,
    required this.textActionName,
    required this.onTap,
    required this.width,
    required this.height,
    this.suffixIcon,
    this.color,
    this.borderColor, // Optional border color
    this.textcolor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.appBkYellow600
              : color ?? const Color(0xFFE9D5FF),
          borderRadius: BorderRadius.circular(5.h),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1.4)
              : null, // Apply the border color if provided
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textActionName,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: textcolor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
              if (suffixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: suffixIcon,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AltActionButtonSecondary extends StatelessWidget {
  final String textActionName;
  final double width;
  final double height;
  void Function()? onTap;
  final Widget? suffixIcon;
  final Color? borderColor; // New optional border color

  AltActionButtonSecondary({
    super.key,
    required this.textActionName,
    required this.onTap,
    required this.width,
    required this.height,
    this.suffixIcon,
    this.borderColor, // Optional border color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? AppColors.appBkYellow600,
            width: 1.4, // Set the border width here
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(5.h),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    textActionName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontStyle: FontStyle.normal,
                        color: Theme.of(context).textTheme.bodyMedium!.color),
                  ),
                ],
              ),
              if (suffixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: suffixIcon,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
