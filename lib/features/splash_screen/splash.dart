import 'dart:async';
import 'dart:math';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elmer/features/auth/presentation/view/login_signup.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController animationController;
  final random = Random();
  double min = -10.0;
  double max = 10.0;
  double randomNumber = 4;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..animateTo(1);

    Timer(const Duration(seconds: 4), () {
      Navigator.pushNamed(context, WelcomeScreen.routeName);
    });
  }

  SharedPreferences? prefs;
  bool isLightMode = false;
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    randomNumber = min + random.nextDouble() * (max - min);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Elmer',
            style: AppTextStyle.h1.copyWith(
              color: AppColors.elmerGreen,
            ),
          ),
        ),
      ),
    );
  }
}
