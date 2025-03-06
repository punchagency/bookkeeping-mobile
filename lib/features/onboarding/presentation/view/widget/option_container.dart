import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:flutter/material.dart';

class BusinessOptionCard extends StatelessWidget {
  final String label;
  final String letter;
  final VoidCallback onTap;

  const BusinessOptionCard({
    Key? key,
    required this.label,
    required this.letter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.elmerGreen,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.elmerGreen,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Text(
                letter,
                style: AppTextStyle.b1.copyWith(
                  color: AppColors.elmerGreen,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            8.toRowSpace(),
            Text(
              label,
              style: AppTextStyle.b1.copyWith(
                color: AppColors.elmerGreen,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
