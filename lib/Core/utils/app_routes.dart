import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/ForgetPasswordScreen.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/LoginScreen.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/EmailVerificationScreen.dart';

import '../../Features/Auth/Sign_Up/presentation/View/widgets/SignUpPage.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ForgetPasswordScreen.id:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case EmailVerificationScreen.id:
        return MaterialPageRoute(builder: (_) => const EmailVerificationScreen());
      case SignUpPage.id:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Page Not Found")),
      ),
    );
  }
}
