import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ResetPasswordPageBody.dart';

import '../../../../../../Core/widgets/custom_app_bar.dart';

class ResetPasswordPage extends StatelessWidget {
  static const String id = "resetPasswordPageView";
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          title: 'Reset Password',
          leadingVisibility: true,
        ),
      ),
      body: ResetPasswordPageBody(),
    );
  }
}
