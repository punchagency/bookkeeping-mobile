import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class SignUpOtpScreen extends StatefulWidget {
  const SignUpOtpScreen({super.key});

  @override
  _SignUpOtpScreenState createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter the OTP sent to your email/phone',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 5,
              borderColor: AppColors.elmerGreen,
              enabledBorderColor: AppColors.elmerGreen,
              focusedBorderColor: AppColors.elmerGreen,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                setState(() {
                  _otpController.text = code;
                });
              },
              onSubmit: (String verificationCode) {
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return AlertDialog(
                //         title: Text("Verification Code"),
                //         content: Text('Code entered is $verificationCode'),
                //       );
                //     });
              }, // end onSubmit
            ),
            100.toColumnSpace(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.mobileSetupPassword);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.elmerGreen,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Verify OTP',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
