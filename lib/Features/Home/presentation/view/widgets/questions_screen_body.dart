import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/answers_list_view.dart';

class QuestionsScreenBody extends StatelessWidget {
  const QuestionsScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 11.h),
        Text('Question 1 of 20',
            style: AppTextStyles.instance.textStyle14
                .copyWith(color: AppColors.kNoOfQuestionsColor)),
        SizedBox(height: 3.h),
        LinearProgressBar(
          minHeight: 4,
          maxSteps: 6,
          progressType: LinearProgressBar.progressTypeLinear,
          currentStep: 1,
          progressColor: AppColors.kPrimaryColor,
          backgroundColor: Color(0xffCFCFCF),
        ),
        SizedBox(height: 28.h),
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            'Select the correctly punctuated sentence.',
            style: AppTextStyles.instance.textStyle18
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 24.h),
        AnswersListView(),
        SizedBox(height: 70.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            QuestionsScreenBodyActionButton(
                backgroundColor: Colors.white,
                text: 'Back',
                onPressed: () {},
                textColor: AppColors.kPrimaryColor),
            QuestionsScreenBodyActionButton(
                backgroundColor: AppColors.kPrimaryColor,
                text: 'Next',
                onPressed: () {},
                textColor: Colors.white),
          ],
        ),
      ],
    );
  }
}

class QuestionsScreenBodyActionButton extends StatelessWidget {
  const QuestionsScreenBodyActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });
  final String text;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 163.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.kPrimaryColor),
                borderRadius: BorderRadius.circular(10.r),
              )),
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyles.instance.textStyle16
                .copyWith(fontWeight: FontWeight.w500, color: textColor),
          )),
    );
  }
}
