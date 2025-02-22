import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      this.style,
      required this.child,
      this.backgroundColor});

  final void Function() onPressed;

  final TextStyle? style;
  final Widget child;
  final WidgetStateProperty<Color?>? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.r),
                ),
              ),
              backgroundColor: backgroundColor ??
                  WidgetStateProperty.all<Color>(AppColors.kPrimaryColor)),
          onPressed: onPressed,
          child: child),
    );
  }
}
