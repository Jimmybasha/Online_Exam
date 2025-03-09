import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class ExamInstructionsWidget extends StatelessWidget {
  const ExamInstructionsWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: 10.r,
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: Text(text,
              softWrap: true,
              style: AppTextStyles.instance.textStyle14
                  .copyWith(color: Color(0xff535353))),
        ),
      ],
    );
  }
}