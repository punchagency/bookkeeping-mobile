import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.elmerGreen,
          borderRadius: BorderRadius.circular(50.0),
        ),
        width: 100.w,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.b1.copyWith(
              color: AppColors.appBKWhite150,
            ),
          ),
        ),
      ),
    );
  }
}
