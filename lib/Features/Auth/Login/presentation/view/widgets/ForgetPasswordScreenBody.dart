import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/custom_button.dart';
import 'package:online_exam/Core/widgets/custom_text_form_field.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/EmailVerificationScreen.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Forget password',
                  style: AppTextStyles.instance.textStyle18
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16.h),
                Text(
                  textAlign: TextAlign.center,
                  'Please enter your email associated to your account',
                  style: AppTextStyles.instance.textStyle14,
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          CustomTextFormField(
            hintText: 'Enter you email',
            label: 'Email',
          ),
          SizedBox(height: 48.h),
          CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, EmailVerificationScreen.id);
              },
              text: 'Continue'),
        ],
      ),
    );
  }
}
