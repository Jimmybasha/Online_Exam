import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key, this.title, this.content, this.onPressed,
  });
  final String? title;
  final String? content;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.kNavBarBackgroundColor,
      elevation: 10.r,
      title: Text(
        title ?? "",
        style: AppTextStyles.instance.textStyle16
            .copyWith(color: AppColors.kPrimaryColor),
      ),
      content: Text(
        content??'',
        style: AppTextStyles.instance.textStyle16
            .copyWith(color: AppColors.kPrimaryColor),
      ),
      actions: [
        TextButton(
            onPressed: onPressed,
            child: Text(
              'Ok',
              style: AppTextStyles.instance.textStyle12
                  .copyWith(color: AppColors.kPrimaryColor),
            ))
      ],
    );
  }
}
