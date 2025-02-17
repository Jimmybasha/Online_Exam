import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

import '../../../../Sign_Up/presentation/View/widgets/SignUpPage.dart';

class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: AppTextStyles.instance.textStyle16
              .copyWith(fontWeight: FontWeight.w400),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpPage.id);
          },

          child: Text("Sign up",
              style: TextStyle(
                color: AppColors.kPrimaryColor,
                fontSize: AppTextStyles.instance.textStyle16.fontSize,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.kPrimaryColor,
              ),

          ),
        )
      ],
    );
  }
}
