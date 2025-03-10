// ignore_for_file: library_private_types_in_public_api

import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoPage extends StatefulWidget {

  const PersonalInfoPage({
    super.key,
  });

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final TextEditingController _companyNameController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    super.dispose();
  }

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
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.menu,
                color: AppColors.elmerGreen,
                size: 40.sp,
              ),
            ),
            20.toColumnSpace(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '5➝',
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
                        "Your Info",
                        style: AppTextStyle.l2.copyWith(),
                      ),
                      20.toColumnSpace(),
                      Text(
                        "First Name",
                        style: AppTextStyle.l2.copyWith(),
                      ),
                      10.toColumnSpace(),
                      TextField(
                        controller: _companyNameController,
                        decoration: const InputDecoration(
                          hintText: 'Jane',
                          border: OutlineInputBorder(),
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
                      20.toColumnSpace(),
                      Text(
                        "Last Name",
                        style: AppTextStyle.l2.copyWith(),
                      ),
                      10.toColumnSpace(),
                      TextField(
                        controller: _companyNameController,
                        decoration: const InputDecoration(
                          hintText: 'Smith',
                          border: OutlineInputBorder(),
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
            32.toColumnSpace(),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Next',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.mobileTailorElmer);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
