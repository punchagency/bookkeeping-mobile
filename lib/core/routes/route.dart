import 'package:elmer/config/responsive_layout.dart';
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

class AppRoutes {
  static const routeName = '/welcome';
  static const moblieLoginScreen = '/login';
  static const mobileEmailNumberScreen = '/email_phone';
  static const mobileLoginPassword = '/loginpassword';
  static const mobileForgetPassword = '/forgot_password';
  static const mobileSignUpOtp = '/signupOtp';
  static const mobileSetupPassword = '/setup_password';
  static const mobileForgetPasswordOtp = '/otp';
  static const mobileDashbord = '/dashboard';
  static const mobileTailorElmer = '/TailorElmer';
  static const mobileBussinesPersonalPage = '/BussinesPersonalPage';
  static const mobileCompanyFormPage = '/CompanyFormPage';
  static const mobileCompanyWebsiteForm = '/CompanyWebsiteForm';
  static const mobileIndustryCategoryPage = '/IndustryCategoryPage';
  static const mobileBusinessStructure = '/BusinessStructure';
  static const mobilePersonalInfoPage = '/PersonalInfoPage';
  static const mobilemobilePersonalInfoPage = '/mobilePersonalInfoPage';

// ..
// .
// ..
// .
// .
  // case Desktop Screen
  static const desktopChatScreen = '/ChatPage';

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
        return MaterialPageRoute(builder: (_) => const OtpScreen());

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

      case mobilemobilePersonalInfoPage:
        return MaterialPageRoute(builder: (_) => const SelectBankPage());
      

// ..
// .
// ..
// .
// .
      // case Desktop Screen
      case desktopChatScreen:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Splash(),
          settings: const RouteSettings(name: Splash.routeName),
        );
    }
  }
}
