import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/shared/formfield/textfield.dart';

class SetupPasswordScreen extends StatefulWidget {
  const SetupPasswordScreen({Key? key}) : super(key: key);

  @override
  _SetupPasswordScreenState createState() => _SetupPasswordScreenState();
}

class _SetupPasswordScreenState extends State<SetupPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Setup Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: _getResponsiveFontSize(context, 18),
          ),
        ),
        backgroundColor: AppColors.elmerGreen,
        centerTitle: true,
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
                  'Create Your Password',
                  style: AppTextStyle.h1.copyWith(
                    color: AppColors.elmerGreen,
                    fontSize: _getResponsiveFontSize(context, 28),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Choose a strong password for your account',
                  style: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey700,
                    fontSize: _getResponsiveFontSize(context, 14),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                TextFieldWidget(
                  controller: _passwordController,
                  titleText: 'New Password',
                  hintText: 'Enter your new password',
                  obscureText: !_isPasswordVisible,
                  textStyle: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey800,
                    fontSize: _getResponsiveFontSize(context, 14),
                  ),
                  fillColor: AppColors.appBkWhite,
                  isFilled: true,
                  prefixText: null,
                  icon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.h),
                TextFieldWidget(
                  controller: _confirmPasswordController,
                  titleText: 'Confirm Password',
                  hintText: 'Confirm your new password',
                  obscureText: !_isConfirmPasswordVisible,
                  textStyle: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey800,
                    fontSize: _getResponsiveFontSize(context, 14),
                  ),
                  fillColor: AppColors.appBkWhite,
                  isFilled: true,
                  prefixText: null,
                  icon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
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
                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final password = _passwordController.text.trim();
                      final confirmPassword =
                          _confirmPasswordController.text.trim();

                      if (password.isNotEmpty && confirmPassword.isNotEmpty) {
                        if (password == confirmPassword) {
                          Navigator.pushNamed(
                              context, AppRoutes.mobileBussinesPersonalPage);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Passwords do not match. Please try again.'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields.'),
                          ),
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
                      'Submit',
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
