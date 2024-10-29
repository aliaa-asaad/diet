import 'package:diet/core/routing/diet_routes.dart';
import 'package:diet/features/auth/forget_password/view/screens/forget_password_screen.dart';
import 'package:diet/features/auth/login/view/screens/login_screen.dart';
import 'package:diet/features/auth/register/view/screens/register_screen.dart';
import 'package:diet/features/home/home_screen.dart';
import 'package:diet/features/nav_bar/view/screens/custom_nav_bar.dart';
import 'package:diet/features/profile/view/screens/profile_screen.dart';
import 'package:diet/features/splash/splash_screen.dart';
import 'package:diet/features/total/view/screens/total_screen.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static Map<String, WidgetBuilder> routes = {AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.forgetPassword: (context) => const ForgetPasswordScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.navBar: (context) => const CustomNavBar(),
        AppRoutes.total :(context)=>const TotalScreen()};
}
