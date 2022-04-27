import '../../presentation/contact_us/contact_us_view.dart';
import '../../presentation/forgot_password/view/forgot_password_view.dart';
import '../../presentation/regiser/view/register_view.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/splash/splash_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/di.dart';
import '../login/view/login_view.dart';
import '../main/main_view.dart';
import '../onboarding/view/onboarding_view.dart';
import '../store_details/view/store_details_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String contactUsRoute = "/contactUs";
}
class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> const SplashView());
        case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_)=> const LoginView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_)=> const RegisterView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_)=> const ForgotPasswordView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_)=> const MainView());
      // case Routes.storeDetailsRoute:
      //   // initStoreDetailsModule();
      //   return MaterialPageRoute(builder: (_)=> const StoreDetailsView());
      case Routes.contactUsRoute:
        return MaterialPageRoute(builder: (_)=> const ContactUsView());
      default:
        return unDefinedRoute();
    }
  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title:  Text(AppStrings.noRouteFound.tr()),),
      body:  Center(
        child: Text(AppStrings.noRouteFound.tr()),
      ),
    ),);
  }
}