import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/text_styles.dart';
import '../../../../core/utils/colors.dart';

class SelectBankPage extends StatefulWidget {
  const SelectBankPage({super.key});

  @override
  State<SelectBankPage> createState() => _SelectBankPageState();
}

class _SelectBankPageState extends State<SelectBankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.elmerGreen,
        title: Text(
          'Elmer',
          style: AppTextStyle.h2.copyWith(
            color: AppColors.appBKWhite150,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.menu,
                color: AppColors.elmerGreen,
                size: 40.sp,
              ),
            ),
            10.toColumnSpace(),
            Center(
              child: Text(
                'Sync Your Account',
                style: AppTextStyle.h3.copyWith(
                  color: AppColors.elmerGreen,
                ),
              ),
            ),
            10.toColumnSpace(),
            Center(child: Image.asset('assets/pngs/bank.png', height: 500.h)),
            10.toColumnSpace(),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Next',
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.mobileDashbord);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
