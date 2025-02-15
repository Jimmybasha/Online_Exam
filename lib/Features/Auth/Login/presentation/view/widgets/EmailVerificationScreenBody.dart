import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/CustomCodeBoxTextField.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/resend_code.dart';

class EmailVerificationScreenBody extends StatelessWidget {
  const EmailVerificationScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email verification',
                style: AppTextStyles.instance.textStyle18
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16.h),
              Text(
                textAlign: TextAlign.center,
                'Please enter your code that send to your email address ',
                style: AppTextStyles.instance.textStyle14,
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Row(
          children: List.generate(4, (index) => CustomCodeBoxTextFiled()),
        ),
        SizedBox(height: 24.h),
        const ResendCode(),
      ],
    );
  }
}
