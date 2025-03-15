import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';

import '../../../../../Core/Constants/app_colors.dart';
import '../../../../../Core/Constants/app_text_style.dart';
import '../../../../../Core/widgets/custom_button.dart';
import '../ResultScreen.dart';
import '../main_screen.dart';
import 'CircularPercentIndiactorWidget.dart';
import 'CorrectInfoWidget.dart';
import 'IncorrectInfoWidget.dart';

class ScoreScreenBody extends StatelessWidget {
  final CheckAnswerModel scoreModel;

  const ScoreScreenBody({
    super.key,
    required this.scoreModel,
  });

  @override
  Widget build(BuildContext context) {
    // Parse percentage from string (e.g., "50%") to double (0.5)
    final double percentage = double.parse(scoreModel.total!.replaceAll('%', '')) / 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        Text(
          'Your Score',
          style: AppTextStyles.instance.textStyle18
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            CircularPercentIndicatorWidget(percentage: percentage),
            SizedBox(width: 28.w),
            Column(
              children: [
                CorrectInfoWidget(correctCount: scoreModel.correct??0),
                SizedBox(height: 11.h),
                InCorrectInfoWidget(incorrectCount: scoreModel.wrong??0)
              ],
            ),
          ],
        ),
        SizedBox(
          height: 80.h,
        ),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, ResultScreen.id);
          },
          child: Text(
            'Show results',
            style: AppTextStyles.instance.textStyle16
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        CustomButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              MainScreen.id,
                  (route) => false,
            );
          },
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          child: Text('Start again',
              style: AppTextStyles.instance.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    );
  }

}