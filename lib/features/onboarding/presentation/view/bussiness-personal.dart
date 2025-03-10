import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/company_form.dart';
import 'package:elmer/features/onboarding/presentation/view/personal_flow/person_info_page.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/option_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BussinesPersonalPage extends StatefulWidget {
  static const routeName = '/BussinesPersonalPage';
  const BussinesPersonalPage({super.key});

  @override
  _BussinesPersonalPageState createState() => _BussinesPersonalPageState();
}

class _BussinesPersonalPageState extends State<BussinesPersonalPage> {
  String? selectedOption; // Tracks the selected option (Business or Personal)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.elmerGreen,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Hi, I\'m Elmer, nice to meet you. I\'ll need a little information for us to get started. 3+ How will you be using me?',
                style: AppTextStyle.b1.copyWith(
                  color: AppColors.elmerGreen,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            50.toColumnSpace(),
            RichText(
              text: TextSpan(
                text: 'A. ',
                style: AppTextStyle.b3.copyWith(
                  color: Color(0xff01CD22),
                ),
                children: [
                  TextSpan(
                    text: 'How will you be using me?',
                    style: AppTextStyle.b3.copyWith(
                      color: AppColors.appBkGrey800,
                    ),
                  ),
                ],
              ),
            ),
            20.toColumnSpace(),
            BusinessOptionCard(
              onTap: () {
                setState(() {
                  selectedOption = 'Business';
                });
              },
              letter: 'A',
              label: 'Business',
            ),
            10.toColumnSpace(),
            BusinessOptionCard(
              onTap: () {
                setState(() {
                  selectedOption = 'Personal';
                });
              },
              letter: 'B',
              label: 'Personal',
            ),
            32.toColumnSpace(),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Next',
                onTap: () {
                  if (selectedOption == 'Business') {
                    Navigator.pushNamed(context, CompanyFormPage.routeName);
                  } else if (selectedOption == 'Personal') {
                    Navigator.pushNamed(context, PersonalInfoPage.routeName);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select an option')),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
