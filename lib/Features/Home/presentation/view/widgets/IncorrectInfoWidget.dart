
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constants/app_text_style.dart';

class InCorrectInfoWidget extends StatelessWidget {
  final int incorrectCount;

  const InCorrectInfoWidget({
    super.key,
    required this.incorrectCount,
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
        SizedBox(width: 70.w),
        Container(
          width: 25.w,
          height: 25.h,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110.r),
            border: Border.all(color: Colors.red),
          ),
          child: Text(
            '$incorrectCount',
            textAlign: TextAlign.center,
            style:
            AppTextStyles.instance.textStyle13.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}