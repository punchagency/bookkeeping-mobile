import 'package:elmer/config/responsive_layout.dart';
import 'package:elmer/features/auth/presentation/view/mobile/forgot_password/setup_password_screen.dart';
import 'package:elmer/features/auth/presentation/view/web/forgot_password/forgot_password.dart';
import 'package:elmer/features/auth/presentation/view/web/login/login.dart';
import 'package:elmer/features/auth/presentation/view/web/login/login_password.dart';
import 'package:elmer/features/auth/presentation/view/web/welcome_screen.dart';
import 'package:elmer/features/chat/presentation/view/desktop/chat_page.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/business_structure.dart';
import 'package:elmer/features/onboarding/presentation/view/bussiness-personal.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/company_form.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/company_website.dart';
import 'package:elmer/features/onboarding/presentation/view/businnes_flow/industry_categories.dart';
import 'package:elmer/features/onboarding/presentation/view/personal_flow/person_info_page.dart';
import 'package:elmer/features/onboarding/presentation/view/select_bank.dart';
import 'package:elmer/features/onboarding/presentation/view/tailor_elmer.dart';
import 'package:flutter/material.dart';
import 'package:elmer/features/auth/presentation/view/mobile/forgot_password/forgot_password.dart';
import 'package:elmer/features/auth/presentation/view/mobile/forgot_password/otp_screen.dart';
import 'package:elmer/features/auth/presentation/view/mobile/login/login.dart';
import 'package:elmer/features/auth/presentation/view/mobile/login/login_password.dart';
import 'package:elmer/features/auth/presentation/view/mobile/signup/email_phone_number.dart';
import 'package:elmer/features/auth/presentation/view/mobile/welcome_screen.dart';
import 'package:elmer/features/auth/presentation/view/mobile/signup/otp_screen.dart';
import 'package:elmer/features/auth/presentation/view/mobile/signup/setup_password.dart';
import 'package:elmer/features/dashboard/presentation/view/dashboard.dart';
import 'package:elmer/features/splash_screen/splash.dart';

class AppRoutes {
  static const routeName = '/welcome';
  static const moblieLoginScreen = '/login';
  static const mobileEmailNumberScreen = '/email_phone';
  static const mobileLoginPassword = '/loginpassword';
  static const mobileForgetPassword = '/forgot_password';
  static const mobileSignUpOtp = '/signupOtp';
  static const mobileSetupPassword = '/setup_password';
  static const mobileNewForgetPassword = '/mobileNewForgetPassword';
  static const mobileForgetPasswordOtp = '/otp';
  static const mobileDashbord = '/dashboard';
  static const mobileTailorElmer = '/TailorElmer';
  static const mobileBussinesPersonalPage = '/BussinesPersonalPage';
  static const mobileCompanyFormPage = '/CompanyFormPage';
  static const mobileCompanyWebsiteForm = '/CompanyWebsiteForm';
  static const mobileIndustryCategoryPage = '/IndustryCategoryPage';
  static const mobileBusinessStructure = '/BusinessStructure';
  static const mobilePersonalInfoPage = '/PersonalInfoPage';
  static const mobileSelectBankPage = '/mobilePersonalInfoPage';

// ..
// .
// ..
// .
// .
  // case web Screen
  static const webWelcomeScreen = '/webWelcomeScreen';
  static const webChatScreen = '/ChatPage';
  static const webLoginScreen = '/webLoginScreen';
  static const webLoginPassword = '/webLoginPassword';
  static const webForgetPassword = '/webForgetPassword';
  static const webEmailNumberScreen = '/email_phone';
  static const webSignUpOtp = '/signupOtp';
  static const webSetupPassword = '/setup_password';
  static const webForgetPasswordOtp = '/otp';
  static const webDashbord = '/dashboard';
  static const webTailorElmer = '/TailorElmer';
  static const webBussinesPersonalPage = '/BussinesPersonalPage';
  static const webCompanyFormPage = '/CompanyFormPage';
  static const webCompanyWebsiteForm = '/CompanyWebsiteForm';
  static const webIndustryCategoryPage = '/IndustryCategoryPage';
  static const webBusinessStructure = '/BusinessStructure';
  static const webPersonalInfoPage = '/PersonalInfoPage';
  static const webSelectBankPage = '/mobilePersonalInfoPage';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Splash.routeName:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
          settings: const RouteSettings(name: Splash.routeName),
        );
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: const RouteSettings(name: HomePage.routeName),
        );
      case routeName:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case moblieLoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case mobileLoginPassword:
        return MaterialPageRoute(builder: (_) => const LogInPasswordScreen());

      case mobileEmailNumberScreen:
        return MaterialPageRoute(builder: (_) => const EmailPhoneScreen());

      case mobileForgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case mobileSignUpOtp:
        return MaterialPageRoute(builder: (_) => const SignUpOtpScreen());

      case mobileSetupPassword:
        return MaterialPageRoute(builder: (_) => const SetupPasswordScreen());

      case mobileForgetPasswordOtp:
        return MaterialPageRoute(
            builder: (_) => const MobileForgetPasswordOtpScreen());

      case mobileNewForgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case mobileDashbord:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case mobileBussinesPersonalPage:
        return MaterialPageRoute(builder: (_) => const BussinesPersonalPage());

      case mobileCompanyFormPage:
        return MaterialPageRoute(builder: (_) => const CompanyFormPage());

      case mobileCompanyWebsiteForm:
        return MaterialPageRoute(builder: (_) => const CompanyWebsiteForm());

      case mobileIndustryCategoryPage:
        return MaterialPageRoute(builder: (_) => const IndustryCategoryPage());

      case mobileBusinessStructure:
        return MaterialPageRoute(builder: (_) => const BusinessStructure());

      case mobileTailorElmer:
        return MaterialPageRoute(builder: (_) => const TailorElmer());

      case mobilePersonalInfoPage:
        return MaterialPageRoute(builder: (_) => const PersonalInfoPage());

      case mobileSelectBankPage:
        return MaterialPageRoute(builder: (_) => const SelectBankPage());

// ..
// .
// ..
// .
// .
      // case Desktop Screen
      case webWelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WebWelcomeScreen());

      // web login screen
      case webLoginScreen:
        return MaterialPageRoute(builder: (_) => const WebLoginScreen());

      case webLoginPassword:
        return MaterialPageRoute(
            builder: (_) => const WebLogInPasswordScreen());

      // web forgot password screen
      case webForgetPassword:
        return MaterialPageRoute(
            builder: (_) => const WebForgotPasswordScreen());

      case webWelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WebWelcomeScreen());

      case webWelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WebWelcomeScreen());

      case webWelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WebWelcomeScreen());

      case webWelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WebWelcomeScreen());

      case webChatScreen:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
          settings: const RouteSettings(name: Splash.routeName),
        );
    }
  }
}
