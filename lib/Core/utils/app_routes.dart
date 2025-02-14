import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/forget_password_view.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/email_verification_view.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  ForgetPasswordView.id: (context) => const ForgetPasswordView(),
  EmailVerificationView.id: (context) => const EmailVerificationView(),
};
