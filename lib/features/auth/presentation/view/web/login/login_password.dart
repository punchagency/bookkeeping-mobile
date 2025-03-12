import 'package:elmer/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/shared/formfield/textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebLogInPasswordScreen extends StatefulWidget {
  const WebLogInPasswordScreen({Key? key}) : super(key: key);

  @override
  _WebLogInPasswordScreenState createState() => _WebLogInPasswordScreenState();
}

class _WebLogInPasswordScreenState extends State<WebLogInPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(
      //   title: Text(
      //     'Enter Password',
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
                  'Enter your password to continue',
                  style: AppTextStyle.l3.copyWith(
                    color: AppColors.appBkGrey600,
                    fontSize: _getResponsiveFontSize(context, 16),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                TextFieldWidget(
                  color: AppColors.appBkGrey800,
                  controller: _passwordController,
                  titleText: 'Password',
                  hintText: 'Enter your password',
                  obscureText: true,
                  textStyle: AppTextStyle.b3.copyWith(
                    color: AppColors.appBkGrey800,
                    fontSize: _getResponsiveFontSize(context, 14),
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
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final password = _passwordController.text.trim();
                      if (password.isNotEmpty) {
                        Navigator.pushNamed(context, AppRoutes.webChatScreen);
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
                      'Login',
                      style: AppTextStyle.b1.copyWith(
                        color: Colors.white,
                        fontSize: _getResponsiveFontSize(context, 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.webForgetPassword);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyle.b3.copyWith(
                      color: AppColors.appBkBlack52,
                      fontSize: _getResponsiveFontSize(context, 14),
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
