import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constants/app_colors.dart';
import '../../../../../Core/Constants/app_text_style.dart';

class CorrectInfoWidget extends StatelessWidget {
  final int correctCount;

  const CorrectInfoWidget({
    super.key,
    required this.correctCount,
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
        SizedBox(width: 76.w),
        Container(
          width: 25.w,
          height: 25.h,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110.r),
            border: Border.all(color: AppColors.kPrimaryColor),
          ),
          child: Text(
            '$correctCount',
            textAlign: TextAlign.center,
            style: AppTextStyles.instance.textStyle13
                .copyWith(color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
