import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/shared/formfield/textfield.dart';

class LogInPasswordScreen extends StatefulWidget {
  const LogInPasswordScreen({Key? key}) : super(key: key);

  @override
  _LogInPasswordScreenState createState() => _LogInPasswordScreenState();
}

class _LogInPasswordScreenState extends State<LogInPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBkWhite,
      appBar: AppBar(
        title: const Text('Enter Password',
            style: TextStyle(
              color: Colors.white,
            )),
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
              'Enter your password to continue',
              style: AppTextStyle.l3.copyWith(
                color: AppColors.appBkGrey600,
              ),
            ),
            40.toColumnSpace(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFieldWidget(
                    color: AppColors.appBkGrey800,
                    controller: _passwordController,
                    titleText: 'Password',
                    hintText: 'Enter your password',
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
                  ElevatedButton(
                    onPressed: () {
                      final password = _passwordController.text.trim();
                      if (password.isNotEmpty) {
                        Navigator.pushNamed(context, AppRoutes.mobileDashbord);
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
                      'Login',
                      style: AppTextStyle.b1.copyWith(
                        color: AppColors.appBkWhite,
                      ),
                    ),
                  ),
                  20.toColumnSpace(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRoutes.mobileForgetPassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: AppTextStyle.b3.copyWith(
                        color: AppColors.appBkBlack52,
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
