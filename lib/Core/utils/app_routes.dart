import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/ForgetPasswordScreen.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/EmailVerificationScreen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  ForgetPasswordScreen.id: (context) => const ForgetPasswordScreen(),
  EmailVerificationScreen.id: (context) => const EmailVerificationScreen(),
};
