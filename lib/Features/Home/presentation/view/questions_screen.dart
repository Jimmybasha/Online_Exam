import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});
  static const String id = 'QuestionsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHight.h),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, right: 16.w),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                    Text(
                      'Exam',
                      style: AppTextStyles.instance.textStyle20
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    Image.asset('assets/images/alarm_clock.png'),
                    Text(
                      '30.00',
                      style: AppTextStyles.instance.textStyle20
                          .copyWith(color: AppColors.kNonCriticalTime),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
     
    );
  }
}
