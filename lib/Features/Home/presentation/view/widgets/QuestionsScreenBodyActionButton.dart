
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Constants/app_colors.dart';
import '../../../../../Core/Constants/app_text_style.dart';

class QuestionsScreenBodyActionButton extends StatelessWidget {
  const QuestionsScreenBodyActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.visible
  });
  final String text;
  final void Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool? visible;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 163.w,
      child: Visibility(
        replacement: SizedBox.shrink(),
        visible: visible??true,
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
      ),
    );
  }
}