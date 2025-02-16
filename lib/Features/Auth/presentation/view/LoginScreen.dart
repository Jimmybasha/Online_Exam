import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';

import 'widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "loginScreenPage";
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          title: 'Login',
          leadingVisibility: false,
        ),
      ),
      body: LoginScreenBody(),
    );
  }
}
