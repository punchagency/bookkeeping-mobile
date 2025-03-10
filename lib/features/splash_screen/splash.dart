import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:elmer/features/chat/presentation/view/desktop/chat_page.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';
  const Splash({super.key});

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
      //   if (kIsWeb) {
      //   // Web-specific navigation
      //   Navigator.pushReplacementNamed(context, WebHomeScreen.routeName);
      // } else
      if (Platform.isAndroid || Platform.isIOS) {
        // Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
      } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        Navigator.pushReplacementNamed(context, ChatPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final random = Random();
    randomNumber = min + random.nextDouble() * (max - min);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/pngs/elmer_logo.png',
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
