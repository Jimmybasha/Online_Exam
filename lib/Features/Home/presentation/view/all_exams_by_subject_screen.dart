import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/all_exmas_by_subject_screen_body.dart';

class AllExamsBySubjectScreen extends StatelessWidget {
  const AllExamsBySubjectScreen({super.key});
  static const String id = 'all_exam_by_subject_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHight.h),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: CustomAppBar(title: 'subject name', leadingVisibility: true),
        ),
      ),
      body: AllExamsBySubjectScreenBody(),
    );
  }
}
