import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:elmer/features/dashboard/presentation/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TailorElmer extends StatefulWidget {
  static const routeName = '/TailorElmer';

  const TailorElmer({super.key});
  @override
  _TailorElmerState createState() => _TailorElmerState();
}

class _TailorElmerState extends State<TailorElmer> {
  final TextEditingController tailorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.secondaryButton,
        title: Text(
          'Elmer',
          style: AppTextStyle.h2.copyWith(
            color: AppColors.appBKWhite150,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
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
              200.toColumnSpace(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5➝',
                    style: AppTextStyle.l3.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryButton,
                    ),
                  ),
                  10.toRowSpace(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's tailor Elmer to you",
                          style: AppTextStyle.l3.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        10.toRowSpace(),
                        Text(
                          "preferences, industry-specific compliance requirements, financial forecasting needs, key performance indicators (KPIs), tax planning strategies, cash flow management priorities, and any unique business financial challenges.",
                          style: AppTextStyle.b2.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        10.toColumnSpace(),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: tailorController,
                          decoration: InputDecoration(
                            hintText: 'Type your answer here',
                            hintStyle: AppTextStyle.l3.copyWith(
                              fontWeight: FontWeight.w300,
                              decoration: TextDecoration.underline,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                          style: AppTextStyle.l3.copyWith(
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        10.toColumnSpace(),
                        Text(
                          'Shift ⇧ + Enter ↵ to make a line break',
                          style: AppTextStyle.b2.copyWith(
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            color: AppColors.elmerGreen,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              100.toColumnSpace(),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.pushNamed(context, DashboardScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
