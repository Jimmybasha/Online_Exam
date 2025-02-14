import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Didn\'t receive code?',
            style: AppTextStyles.instance.textStyle16),
        GestureDetector(
          onTap: () {},
          child: Text(" Resend",
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: AppTextStyles.instance.textStyle16.fontSize,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.kPrimaryColor,
              )),
        )
      ],
    );
  }
}
