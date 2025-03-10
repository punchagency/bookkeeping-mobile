import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/features/auth/presentation/view/login/login_password.dart';
import 'package:elmer/shared/formfield/textfield.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        title: const Text('Login'),
        backgroundColor: AppColors.elmerGreen,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.appBkWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back',
              style: AppTextStyle.h1.copyWith(
                color: AppColors.elmerGreen,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enter your email or phone number to continue',
              style: AppTextStyle.b3.copyWith(
                color: AppColors.appBkGrey700,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFieldWidget(
                    color: AppColors.appBkGrey800,
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
                        Navigator.pushNamed(
                          context,
                          LogInPasswordScreen.routeName,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.elmerGreen,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Continue',
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
