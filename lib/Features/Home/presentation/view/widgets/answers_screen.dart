import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/answers_screen_body.dart';

class AnswersScreen extends StatelessWidget {
  const AnswersScreen({super.key});
  static const String id = 'AnswersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHight.h),
        child: CustomAppBar(title: 'Answers', leadingVisibility: true),
      ),
      body: AnswersScreenBody(),
    );
  }
}
