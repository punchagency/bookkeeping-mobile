import 'package:elmer/features/splash_screen/splash.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const ResponsiveLayout(
      {super.key, required this.mobile, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return desktop; // Show desktop version for larger screens
        } else {
          return mobile; // Show mobile version for smaller screens
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobile: Text(Splash.routeName),
      desktop: Text(Splash.routeName),
    );
  }
}
