import 'package:elmer/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/features/auth/presentation/view/login/login.dart';
import 'package:elmer/features/auth/presentation/view/signup/email_phone_number.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Elmer',
                style: AppTextStyle.h1.copyWith(
                  color: AppColors.elmerGreen,
                ),
                textAlign: TextAlign.center,
              ),
              20.toColumnSpace(),
              Text(
                'Manage your finances with ease.',
                style: AppTextStyle.b3.copyWith(
                  color: AppColors.elmerGreen,
                ),
                textAlign: TextAlign.center,
              ),
              40.toColumnSpace(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, EmailPhoneScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.elmerGreen,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: AppTextStyle.b1.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              20.toColumnSpace(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: BorderSide(
                      color: AppColors.elmerGreen,
                      width: 2.w,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: AppTextStyle.b1.copyWith(
                      color: AppColors.elmerGreen,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
