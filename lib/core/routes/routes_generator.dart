import 'package:e_commerce/core/routes/app_routes.dart';
import 'package:e_commerce/features/auth/view/congratulations.dart';
import 'package:e_commerce/features/auth/view/forget_password_views/forget_password_with_email.dart';
import 'package:e_commerce/features/auth/view/forget_password_views/forget_password_with_phone.dart';
import 'package:e_commerce/features/auth/view/login_screen.dart';
import 'package:e_commerce/features/auth/view/new_password/new_password_screen.dart';
import 'package:e_commerce/features/auth/view/sign_up_screen.dart';
import 'package:e_commerce/features/auth/view/verfication_code_view/verfication_code_with_email.dart';
import 'package:e_commerce/features/auth/view/verfication_code_view/verfication_code_with_phone.dart';
import 'package:e_commerce/features/cart/view/cart_screen.dart';
import 'package:e_commerce/features/favourite/view/favourite_screen.dart';
import 'package:e_commerce/features/home/view/home_layout.dart';
import 'package:e_commerce/features/home/view/home_screen.dart';
import 'package:e_commerce/features/home/view/view_all_screen.dart';
import 'package:e_commerce/features/menu/view/menu_screen.dart';
import 'package:e_commerce/features/on_boarding/view/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
          case AppRoutes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case AppRoutes.forgetPasswordWithPhone:
        return MaterialPageRoute(builder: (_) => ForgetPasswordWithPhone());
      case AppRoutes.forgetPasswordWithEmail:
        return MaterialPageRoute(builder: (_) => ForgetPasswordWithEmail());
            case AppRoutes.verficationCodeWithEmail:
        return MaterialPageRoute(builder: (_) => VerficationCodeWithEmail());
            case AppRoutes.verficationCodeWithPhone:
        return MaterialPageRoute(builder: (_) => VerficationCodeWithPhone());  
        case AppRoutes.newPasswordScreen:
        return MaterialPageRoute(builder: (_)=>NewPasswordScreen());
        case AppRoutes.congratulations:
        return MaterialPageRoute(builder: (_)=>CongratulationsScreen());
         case AppRoutes.homeLayout:
        return MaterialPageRoute(builder: (_)=>HomeLayout());
         case AppRoutes.home:
        return MaterialPageRoute(builder: (_)=>HomeScreen());
        case AppRoutes.cart:
        return MaterialPageRoute(builder: (_)=>CartScreen());
        case AppRoutes.favourite:
        return MaterialPageRoute(builder: (_)=>FavouriteScreen());
        case AppRoutes.menu:
        return MaterialPageRoute(builder: (_)=>MenuScreen());
        case AppRoutes.viewAll:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(builder: (_)=>ViewAllScreen(title: args?['title']));
       
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Route not found!')),
      ),
    );
  }
}