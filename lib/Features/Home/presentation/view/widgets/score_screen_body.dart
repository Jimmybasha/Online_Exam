import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/custom_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScoreScreenBody extends StatelessWidget {
  const ScoreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Column(
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
              buildCircularPercentIndicator(),
              SizedBox(width: 28.w),
              Column(
                children: [
                  CorrectInfoWidget(),
                  SizedBox(height: 11.h),
                  InCorrectInfoWidget()
                ],
              ),
            ],
          ),
          SizedBox(
            height: 80.h,
          ),
          CustomButton(onPressed: () {}, child: Text('Show results')),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }

  CircularPercentIndicator buildCircularPercentIndicator() {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 6.0,
      animation: true,
      percent: 1.0,
      center: Text("100%"),
      circularStrokeCap: CircularStrokeCap.square,
      backgroundColor: Colors.red,
      progressColor: AppColors.kPrimaryColor,
    );
  }
}

class CorrectInfoWidget extends StatelessWidget {
  const CorrectInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Correct',
          style: AppTextStyles.instance.textStyle16.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.kPrimaryColor),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          width: 25.w,
          height: 25.h,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110.r),
            border: Border.all(color: AppColors.kPrimaryColor),
          ),
          child: Text(
            '18',
            textAlign: TextAlign.center,
            style: AppTextStyles.instance.textStyle13
                .copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}

class InCorrectInfoWidget extends StatelessWidget {
  const InCorrectInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Incorrect',
          style: AppTextStyles.instance.textStyle16
              .copyWith(fontWeight: FontWeight.w500, color: Colors.red),
        ),
        SizedBox(
          width: 50,
        ),
        Container(
          width: 25.w,
          height: 25.h,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110.r),
            border: Border.all(color: Colors.red),
          ),
          child: Text(
            '2',
            textAlign: TextAlign.center,
            style:
                AppTextStyles.instance.textStyle13.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
