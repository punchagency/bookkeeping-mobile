import 'package:elmer/features/onboarding/presentation/view/businnes_flow/business_structure.dart';
import 'package:elmer/features/onboarding/presentation/view/bussiness-personal.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/company_form.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/company_website.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/industry_categories.dart';
import 'package:elmer/features/onboarding/presentation/view/personal_flow/person_info_page.dart';
import 'package:elmer/features/onboarding/presentation/view/tailor_elmer.dart';
import 'package:flutter/material.dart';
import 'package:elmer/features/auth/presentation/view/forgot_password/forgot_password.dart';
import 'package:elmer/features/auth/presentation/view/forgot_password/otp_screen.dart';
import 'package:elmer/features/auth/presentation/view/login/login.dart';
import 'package:elmer/features/auth/presentation/view/login/login_password.dart';
import 'package:elmer/features/auth/presentation/view/signup/email_phone_number.dart';
import 'package:elmer/features/auth/presentation/view/login_signup.dart';
import 'package:elmer/features/auth/presentation/view/signup/otp_screen.dart';
import 'package:elmer/features/auth/presentation/view/signup/setup_password.dart';
import 'package:elmer/features/dashboard/presentation/view/dashboard.dart';
import 'package:elmer/features/splash_screen/splash.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Splash.routeName:
      return MaterialPageRoute(
        builder: (_) => const Splash(),
        settings: const RouteSettings(name: Splash.routeName),
      );
    case WelcomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
        settings: const RouteSettings(name: WelcomeScreen.routeName),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: const RouteSettings(name: LoginScreen.routeName),
      );
    case LogInPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LogInPasswordScreen(),
        settings: const RouteSettings(name: LogInPasswordScreen.routeName),
      );
    case EmailPhoneScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const EmailPhoneScreen(),
        settings: const RouteSettings(name: EmailPhoneScreen.routeName),
      );
    case ForgotPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ForgotPasswordScreen(),
        settings: const RouteSettings(name: ForgotPasswordScreen.routeName),
      );
    case SignUpOtpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpOtpScreen(),
        settings: const RouteSettings(name: SignUpOtpScreen.routeName),
      );
    case SetupPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SetupPasswordScreen(),
        settings: const RouteSettings(name: SetupPasswordScreen.routeName),
      );
    case OtpScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OtpScreen(),
        settings: const RouteSettings(name: OtpScreen.routeName),
      );
    case DashboardScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashboardScreen(),
        settings: const RouteSettings(name: DashboardScreen.routeName),
      );
    case BussinesPersonalPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const BussinesPersonalPage(),
        settings: const RouteSettings(name: BussinesPersonalPage.routeName),
      );
    case CompanyFormPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CompanyFormPage(),
        settings: const RouteSettings(name: CompanyFormPage.routeName),
      );
    case CompanyWebsiteForm.routeName:
      return MaterialPageRoute(
        builder: (_) => const CompanyWebsiteForm(),
        settings: const RouteSettings(name: CompanyWebsiteForm.routeName),
      );
    case IndustryCategoryPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IndustryCategoryPage(),
        settings: const RouteSettings(name: IndustryCategoryPage.routeName),
      );
    case BusinessStructure.routeName:
      return MaterialPageRoute(
        builder: (_) => const BusinessStructure(),
        settings: const RouteSettings(name: BusinessStructure.routeName),
      );
    case TailorElmer.routeName:
      return MaterialPageRoute(
        builder: (_) => const TailorElmer(),
        settings: const RouteSettings(name: TailorElmer.routeName),
      );
    case PersonalInfoPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PersonalInfoPage(),
        settings: const RouteSettings(name: PersonalInfoPage.routeName),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Splash(),
        settings: const RouteSettings(name: Splash.routeName),
      );
  }
}
