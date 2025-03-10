import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/industry_categories.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyWebsiteForm extends StatefulWidget {
  static const routeName = '/CompanyWebsiteForm';
  const CompanyWebsiteForm({super.key});

  @override
  State<CompanyWebsiteForm> createState() => _CompanyWebsiteFormState();
}

class _CompanyWebsiteFormState extends State<CompanyWebsiteForm> {
  final TextEditingController _websiteController = TextEditingController();

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
            200.toColumnSpace(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2➝',
                  style: AppTextStyle.l3.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.elmerGreen,
                  ),
                ),
                10.toRowSpace(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Company Website',
                        style: AppTextStyle.l3.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.toRowSpace(),
                      Text(
                        'Description (optional)',
                        style: AppTextStyle.b2.copyWith(
                          fontWeight: FontWeight.w200,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      10.toColumnSpace(),
                      TextField(
                        controller: _websiteController,
                        decoration: const InputDecoration(
                          hintText: 'Type here...',
                          border: UnderlineInputBorder(),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.elmerGreen,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.elmerGreen,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Next',
                onTap: () {
                  Navigator.pushNamed(context, IndustryCategoryPage.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
