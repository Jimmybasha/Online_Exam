import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/ForgetPasswordScreen.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/LoginScreen.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/EmailVerificationScreen.dart';

import '../../Features/Auth/Sign_Up/presentation/View/widgets/SignUpPage.dart';


Map<String, Widget Function(BuildContext)> appRoutes = {
  ForgetPasswordScreen.id: (context) => const ForgetPasswordScreen(),
  EmailVerificationScreen.id: (context) => const EmailVerificationScreen(),
  SignUpPage.id: (context) => const SignUpPage(),
  LoginScreen.id:(context) => const LoginScreen(),
};
