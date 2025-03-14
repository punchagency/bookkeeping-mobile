import 'package:elmer/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/features/auth/presentation/view/forgot_password/setup_password_screen.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBkWhite,
      appBar: AppBar(
        title: const Text('OTP Verification'),
        backgroundColor: AppColors.elmerGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP Verification',
              style: AppTextStyle.h1,
            ),
            const SizedBox(height: 10),
            Text(
              'Enter the OTP sent to your email or phone number',
              style: AppTextStyle.b3.copyWith(
                color: AppColors.appBkGrey600,
              ),
            ),
            40.toColumnSpace(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  OtpTextField(
                    numberOfFields: 5,
                    borderColor: AppColors.appBkGreen600,
                    enabledBorderColor: AppColors.appBkGreen600,
                    focusedBorderColor: AppColors.appBkGreen600,
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      setState(() {
                        _otpController.text = code;
                      });
                    },
                    onSubmit: (String verificationCode) {},
                  ),
                  40.toColumnSpace(),
                  ElevatedButton(
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
                      backgroundColor: AppColors.appBkGreen600,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Verify OTP',
                      style: AppTextStyle.b1.copyWith(
                        color: AppColors.appBkWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
