import 'package:elmer/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/shared/formfield/textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebLoginScreen extends StatefulWidget {
  const WebLoginScreen({super.key});

  @override
  _WebLoginScreenState createState() => _WebLoginScreenState();
}

class _WebLoginScreenState extends State<WebLoginScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();

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
    _emailPhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(
      //   title: Text(
      //     'Login',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: _getResponsiveFontSize(context, 18),
      //     ),
      //   ),
      //   backgroundColor: AppColors.elmerGreen,
      //   centerTitle: true,
      //   iconTheme: const IconThemeData(
      //     color: AppColors.appBkWhite,
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: AppTextStyle.h1.copyWith(
                    color: AppColors.elmerGreen,
                    fontSize: _getResponsiveFontSize(context, 28),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Enter your email or phone number to continue',
                  style: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey700,
                    fontSize: _getResponsiveFontSize(context, 14),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                TextFieldWidget(
                  color: AppColors.appBkGrey800,
                  controller: _emailPhoneController,
                  titleText: 'Email / Phone Number',
                  hintText: 'Enter your email or phone number',
                  keyboardType: TextInputType.emailAddress,
                  textStyle: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey800,
                    fontSize: _getResponsiveFontSize(context, 14),
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
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final emailPhone = _emailPhoneController.text.trim();
                      if (emailPhone.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.webLoginPassword,
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
                      'Continue',
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
