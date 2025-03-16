import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/exam_model.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/answers_screen.dart';

class ResultsScreenBody extends StatelessWidget {
  const ResultsScreenBody(
      {super.key, required this.examModel, required this.scoreModel});
  final ExamModel examModel;
  final CheckAnswerModel scoreModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Text(
            examModel.examCategory(examModel.title!),
            style: AppTextStyles.instance.textStyle18
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AnswersScreen.id);
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
                                examModel.title ?? 'Not found',
                                style: AppTextStyles.instance.textStyle16
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${examModel.duration} Minutes',
                                style: AppTextStyles.instance.textStyle13
                                    .copyWith(color: AppColors.kPrimaryColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            " ${examModel.numberOfQuestions} Question ",
                            style: AppTextStyles.instance.textStyle13
                                .copyWith(color: AppColors.kNoOfQuestionsColor),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            '${scoreModel.correct} corrected answers in ${examModel.duration} min. ',
                            style: AppTextStyles.instance.textStyle12.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
