import 'package:elmer/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/shared/formfield/textfield.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // bool _isPasswordVisible = false;
  // bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBkWhite,
      appBar: AppBar(
        title: const Text(
          'Setup New Password',
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
            Text(
              'Setup New Password',
              style: AppTextStyle.h1,
            ),
            const SizedBox(height: 10),
            Text(
              'Enter a new password for your account',
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
                    controller: _passwordController,
                    titleText: 'New Password',
                    hintText: 'Enter your new password',
                    obscureText: true,
                    textStyle: AppTextStyle.b3.copyWith(
                      color: AppColors.appBkGrey800,
                    ),
                    fillColor: AppColors.appBkWhite,
                    isFilled: true,
                    prefixText: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    controller: _confirmPasswordController,
                    titleText: 'Confirm Password',
                    hintText: 'Confirm your new password',
                    obscureText: true,
                    textStyle: AppTextStyle.b3.copyWith(
                      color: AppColors.appBkGrey800,
                    ),
                    fillColor: AppColors.appBkWhite,
                    isFilled: true,
                    prefixText: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm password is required';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final password = _passwordController.text.trim();
                      final confirmPassword =
                          _confirmPasswordController.text.trim();
                      if (password.isNotEmpty && confirmPassword.isNotEmpty) {
                        if (password == confirmPassword) {
                          print('New Password: $password');
                          Navigator.pushNamed(
                              context, AppRoutes.moblieLoginScreen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Passwords do not match. Please try again.'),
                            ),
                          );
                        }
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
                      'Submit',
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
