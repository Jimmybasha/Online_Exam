import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ProfilePageBody.dart';

class ProfilePage extends StatelessWidget {
  static const String id = "ProfilePageView";
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(
          title: 'Profile',
          leadingVisibility: false,
        ),
      ),
      body: ProfilePageBody(),
    );
  }
}
