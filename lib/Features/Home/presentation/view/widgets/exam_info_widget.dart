import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import 'package:online_exam/Features/Home/presentation/view/questions_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/exam_details_view.dart';

class ExamInfoWidget extends StatelessWidget {
  const ExamInfoWidget({
    super.key,
    required this.exam,
  });
  final Exam exam;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ExamDetailsView.id, arguments: exam);
      },
      child: Container(
        height: 103.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.r,
              spreadRadius: 0.r,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              Image.asset('assets/images/exam.png'),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          exam.title ?? 'No Title',
                          style: AppTextStyles.instance.textStyle16
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${exam.duration} Minutes',
                          style: AppTextStyles.instance.textStyle13
                              .copyWith(color: AppColors.kPrimaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      " ${exam.numberOfQuestions} Question ",
                      style: AppTextStyles.instance.textStyle13
                          .copyWith(color: AppColors.kNoOfQuestionsColor),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'From: 1.00   To: 6.00',
                      style: AppTextStyles.instance.textStyle13,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
