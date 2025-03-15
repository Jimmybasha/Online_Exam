import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';

class QuestionsScreenAppBar extends StatelessWidget {
  const QuestionsScreenAppBar({
    super.key,
    required this.examModel,
    required this.examDuration,
  });

  final Exam? examModel;
  final int? examDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, right: 16.w),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Text(
                  examModel?.title??"Exam",
                  style: AppTextStyles.instance.textStyle20
                      .copyWith(fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              spacing: 8.w,
              children: [
                Image.asset('assets/images/alarm_clock.png'),
                Text(
                  "${examDuration!.toStringAsFixed(2)} ",
                  style: AppTextStyles.instance.textStyle20.copyWith(
                      color: examDuration! > 15.00
                          ? AppColors.kNonCriticalTime
                          : Colors.red
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
