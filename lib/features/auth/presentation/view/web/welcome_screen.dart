import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebWelcomeScreen extends StatefulWidget {
  const WebWelcomeScreen({Key? key}) : super(key: key);

  @override
  _WebWelcomeScreenState createState() => _WebWelcomeScreenState();
}

class _WebWelcomeScreenState extends State<WebWelcomeScreen> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 600),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Elmer',
                  style: AppTextStyle.h1.copyWith(
                    color: AppColors.elmerGreen,
                    fontSize: _getResponsiveFontSize(context, 28),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Manage your finances with ease.',
                  style: AppTextStyle.b3.copyWith(
                    color: AppColors.elmerGreen,
                    fontSize: _getResponsiveFontSize(context, 14),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                ..._buildButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons() {
    return [
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.mobileEmailNumberScreen);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.elmerGreen,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Sign Up',
            style: AppTextStyle.b1.copyWith(
              color: Colors.white,
              fontSize: _getResponsiveFontSize(context, 14),
            ),
          ),
        ),
      ),
      SizedBox(height: 16.h),
      SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.webLoginScreen);
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: BorderSide(
              color: AppColors.elmerGreen,
              width: 1.5,
            ),
          ),
          child: Text(
            'Login',
            style: AppTextStyle.b1.copyWith(
              color: AppColors.elmerGreen,
              fontSize: _getResponsiveFontSize(context, 14),
            ),
          ),
        ),
      ),
    ];
  }
}
