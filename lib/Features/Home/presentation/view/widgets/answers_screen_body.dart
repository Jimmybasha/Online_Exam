import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class AnswersScreenBody extends StatelessWidget {
  const AnswersScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Text(
          " Question ",
          style: AppTextStyles.instance.textStyle18
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
