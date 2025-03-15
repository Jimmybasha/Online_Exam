import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/score_screen_body.dart';

class ScoreScreen extends StatelessWidget {
  static const String id = "ScorePageId";
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHight.h),
          child: CustomAppBar(
            title: 'Exam score',
            leadingVisibility: true,
          )),
          body: ScoreScreenBody(),
    );
  }
}

