import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:elmer/features/auth/presentation/view/web/forgot_password/setup_password_screen.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordOtpScreenState createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return baseSize;
    if (screenWidth > 600) return baseSize * 0.8;
    return baseSize * 0.7;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
     appBar: AppBar(
        title: const Text(
          'OTP Verification',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.elmerGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OTP Verification',
                  style: AppTextStyle.h1.copyWith(
                    color: AppColors.elmerGreen,
                    fontSize: _getResponsiveFontSize(context, 28),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Enter the OTP sent to your email or phone number',
                  style: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey700,
                    fontSize: _getResponsiveFontSize(context, 14),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: AppColors.elmerGreen,
                  enabledBorderColor: AppColors.elmerGreen,
                  focusedBorderColor: AppColors.elmerGreen,
                  showFieldAsBox: true,
                  fieldWidth: 45,
                  textStyle: TextStyle(
                    fontSize: _getResponsiveFontSize(context, 16),
                  ),
                  onCodeChanged: (String code) {
                    setState(() {
                      _otpController.text = code;
                    });
                  },
                  onSubmit: (String verificationCode) {},
                ),
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final otp = _otpController.text.trim();
                      if (otp.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          ForgetPasswordScreen.routeName,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.elmerGreen,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Verify OTP',
                      style: AppTextStyle.b1.copyWith(
                        color: Colors.white,
                        fontSize: _getResponsiveFontSize(context, 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
