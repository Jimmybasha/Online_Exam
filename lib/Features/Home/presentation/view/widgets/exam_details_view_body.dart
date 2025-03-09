import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/custom_button.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/exam_instructions_widget.dart';

class ExamDetailsViewBody extends StatelessWidget {
  const ExamDetailsViewBody({super.key, required this.exam});
  final Exam exam;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/exam.png'),
              SizedBox(
                width: 16.h,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam.title ?? 'No title',
                      style: AppTextStyles.instance.textStyle20,
                    ),
                  ],
                ),
              ),
              Text(
                '${exam.duration} Minutes',
                style: AppTextStyles.instance.textStyle16
                    .copyWith(color: AppColors.kPrimaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            '${exam.numberOfQuestions ?? ''} Questions',
            style: AppTextStyles.instance.textStyle16
                .copyWith(color: AppColors.kNoOfQuestionsColor),
          ),
          SizedBox(
            height: 16.h,
          ),
          Divider(
            color: Color(0xffCCD7EB),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Instructions',
            style: AppTextStyles.instance.textStyle18
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 16.h,
          ),
          ExamInstructionsWidget(text: 'Read All Questions Carefully.'),
          ExamInstructionsWidget(
              text:
                  ' Keep an eye on the timer to manage your time efficiently.'),
          ExamInstructionsWidget(
              text:
                  'The exam will be automatically submitted when the timer expires.'),
          SizedBox(
            height: 48.h,
          ),
          CustomButton(
              onPressed: () {},
              child: Text(
                'Start ',
                style: AppTextStyles.instance.textStyle16
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
