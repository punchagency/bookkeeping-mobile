import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/features/auth/presentation/view/forgot_password/otp_screen.dart';
import 'package:elmer/shared/formfield/textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/forgot_password';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();

  @override
  void dispose() {
    _emailPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBkWhite,
      appBar: AppBar(
        title: const Text('Forgot Password'),
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
            Text('Forgot Password', style: AppTextStyle.h1),
            const SizedBox(height: 10),
            Text(
              'Enter your email or phone number to reset your password',
              style: AppTextStyle.b3.copyWith(
                color: AppColors.appBkGrey600,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFieldWidget(
                    controller: _emailPhoneController,
                    titleText: 'Email / Phone Number',
                    hintText: 'Enter your email or phone number',
                    keyboardType: TextInputType.emailAddress,
                    textStyle: AppTextStyle.b3.copyWith(
                      color: AppColors.appBkGrey800,
                    ),
                    fillColor: AppColors.appBkWhite,
                    isFilled: true,
                    prefixText: null,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email or phone number is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final emailPhone = _emailPhoneController.text.trim();
                      if (emailPhone.isNotEmpty) {
                        // if (emailPhone == "existing@example.com") {
                        // Navigate to the OTP screen
                        Navigator.pushNamed(
                          context,
                          OtpScreen.routeName,
                        );
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text(
                        //           'User does not exist. Please try again.'),
                        //     ),
                        //   );
                        // }
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
                      'Send OTP',
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
